output "public_ip" {
  value = "${aws_instance.web01.public_ip}"
}

output "public_dns" {
  value = "${aws_instance.web01.public_dns}"
}
