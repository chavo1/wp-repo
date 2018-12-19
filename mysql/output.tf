output "private_ip_db" {
  value = "${aws_instance.db01.private_ip}"
}
