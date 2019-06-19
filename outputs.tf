#output "instance_ip_addr" {
#  value = aws_instance.server.private_ip
#}

output "address" {
  value = "Instances: ${element(aws_instance.web.*.id, 0)}"
}

output "vpc_id" {
  value = "${aws_vpc.tf_vpc.id}"
}

# utput "subnet_id" { 
#  value = "${aws_subnet.subnet_id.id}"
#}
