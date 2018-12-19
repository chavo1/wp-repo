resource "aws_instance" "web01" {
  ami           = "ami-05a36d3b9aa4a17ac"
  instance_type = "t2.micro"
  key_name      = "${aws_key_pair.chavo.id}"

  connection {
    user        = "ubuntu"
    private_key = "${file("id_rsa")}"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo mkdir -p /vagrant/conf",
      "sudo chmod a+rwx /vagrant/conf",
    ]
  }

  provisioner "file" {
    source      = "conf/"
    destination = "/vagrant/conf"
  }

  provisioner "file" {
    source      = "./www.tar.gz"
    destination = "/tmp/www.tar.gz"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod a+rwx /tmp/www.tar.gz",
      "sudo tar -zxvf /tmp/www.tar.gz",
    ]
  }

  provisioner "file" {
    source      = "scripts/provision.sh"
    destination = "/tmp/provision.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod +x /tmp/provision.sh",
      "sudo /tmp/provision.sh",
    ]
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod a+rwx /var/www/app/public/",
      "sudo cp -R /home/ubuntu/www/wordpress/* /var/www/app/public/",
    ]
  }
}
