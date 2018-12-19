resource "aws_key_pair" "chavo-db" {
  key_name   = "chavo-db"
  public_key = "${file("~/.ssh/id_rsa_db.pub")}"
}
