provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

#mysql
module "mysql" {
  source = "mysql"
}

#server
module "server" {
  source = "server"
}

output "public_dns" {
  value = "${module.server.public_dns}"
}

output "public_ip" {
  value = "${module.server.public_ip}"
}

output "private_ip_db" {
  value = "${module.mysql.private_ip_db}"
}

resource "null_resource" "null" {
  depends_on = ["module.server"]

  connection {
    host        = "${module.server.public_ip}"
    user        = "ubuntu"
    private_key = "${file("~/.ssh/id_rsa")}"
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'define('WP_HOME','https://${module.server.public_ip}');' | sudo tee -a /var/www/app/public/wp-config.php",
      "echo 'define('WP_SITEURL','https://${module.server.public_ip}');' | sudo tee -a /var/www/app/public/wp-config.php",
      "echo 'define('RELOCATE',true);' | sudo tee -a /var/www/app/public/wp-config.php",
      "sudo sed -i 's|192.168.56.55|${module.mysql.private_ip_db}|g' /var/www/app/public/wp-config.php",
    ]
  }
}
