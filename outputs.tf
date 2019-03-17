output "id" {
  description = "List of IDs of instances"
  value       = ["${aws_instance.web-1.*.id}"]
}

output "availability_zone" {
  description = "List of availability zones of instances"
  value       = ["${aws_instance.web-1.*.availability_zone}"]
}

// GH issue: https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/8
//output "placement_group" {
//  description = "List of placement groups of instances"
//  value       = ["${element(concat(aws_instance.web-1.*.placement_group, list("")), 0)}"]
//}
//
output "key_name" {
  description = "List of key names of instances"
  value       = ["${aws_instance.web-1.*.key_name}"]
}

output "public_dns" {
  description = "List of public DNS names assigned to the instances. For EC2-VPC, web-1 is only available if you've enabled DNS hostnames for your VPC"
  value       = ["${aws_instance.web-1.*.public_dns}"]
}

output "public_ip" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = ["${aws_instance.web-1.*.public_ip}"]
}

output "network_interface_id" {
  description = "List of IDs of the network interface of instances"
  value       = ["${aws_instance.web-1.*.network_interface_id}"]
}

output "primary_network_interface_id" {
  description = "List of IDs of the primary network interface of instances"
  value       = ["${aws_instance.web-1.*.primary_network_interface_id}"]
}

output "private_dns" {
  description = "List of private DNS names assigned to the instances. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC"
  value       = ["${aws_instance.web-1.*.private_dns}"]
}

output "private_ip" {
  description = "List of private IP addresses assigned to the instances"
  value       = ["${aws_instance.web-1.*.private_ip}"]
}

output "security_groups" {
  description = "List of associated security groups of instances"
  value       = ["${aws_instance.web-1.*.security_groups}"]
}

output "vpc_security_group_ids" {
  description = "List of associated security groups of instances, if running in non-default VPC"
  value       = ["${aws_instance.web-1.*.vpc_security_group_ids}"]
}

output "subnet_id" {
  description = "List of IDs of VPC subnets of instances"
  value       = ["${aws_instance.web-1.*.subnet_id}"]
}

output "tags" {
  description = "List of tags of instances"
  value       = ["${aws_instance.web-1.*.tags}"]
}
