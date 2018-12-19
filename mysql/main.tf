resource "aws_instance" "db01" {
  ami           = "ami-05a36d3b9aa4a17ac"
  instance_type = "t2.micro"
  key_name      = "${aws_key_pair.chavo-db.id}"

  connection {
    user        = "ubuntu"
    private_key = "${file("id_rsa_db")}"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo mkdir -p /vagrant/conf",
      "sudo chmod a+rwx /vagrant/conf",
    ]
  }

  provisioner "file" {
    source      = "conf/"
    destination = "/vagrant/conf/"
  }

  provisioner "file" {
    source      = "scripts/mysql.sh"
    destination = "/tmp/mysql.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod +x /tmp/mysql.sh",
      "sudo /tmp/mysql.sh",
    ]
  }
}
