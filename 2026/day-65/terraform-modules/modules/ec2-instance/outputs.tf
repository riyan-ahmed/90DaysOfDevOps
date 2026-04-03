output "instance_id" {
  value = aws_instance.my-ec2.id
}

output "public_ip" {
  value = aws_instance.my-ec2.public_ip
}

output "private_ip" {
  value = aws_instance.my-ec2.private_ip
}