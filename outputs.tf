output "instance_ip"{
    description = "The Public IP of the Instance"
    value = aws_instance.instance.public_ip
}