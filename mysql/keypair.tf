resource "aws_key_pair" "chavo-db" {
  key_name   = "chavo-db"
  public_key = "${file("id_rsa_db.pub")}"
}
