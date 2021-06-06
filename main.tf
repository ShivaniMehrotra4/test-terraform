// data "aws_ami" "ubuntu" {
//   most_recent = true

//   filter {
//     name   = "name"
//     values = ["ubuntu/images/ubuntu-*-*-amd64-server-*"]
//   }

//   filter {
//     name   = "virtualization-type"
//     values = ["hvm"]
//   }

//   owners = ["838487617183"] # Canonical
// }

resource "aws_key_pair" "key-test" {
  key_name    = "key-test"
  public_key  = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDP351Tx/57OoGvkhGIVOjwdSb0iU7mfN428+mQakXVs2U+EL8DXh8UbEhW9xM+NS/k43p/YNdOT+n27kBPK54yxEe6GFgJHZwlgQDzHSqd/6uIB87E0qs91TZ89qDi20sNgGYkm1wDLqJ6d/Jgu70s5B0MtIv/9UU+dee34EN7G8b4Fwb+3kKKJX+8Zl4of2LKZnS3Xkc17bwmr2EsID9DTKdq3AADIqZFxleqWVYxPaPqiLRGoDUpZt0grZQ2M7tDGhpzVP18F9bUYsaR4HjJZC45y1udoXooPAG71Z/na5xYVd8HPHhSGvPYaFgIOyZcccYdYQAHUYL/L20HUJfz8lJg+/LzZMjpp4NOEwUMHrfx6GuWA2c/P9wm5vjXZdSLHjCGMPdskOe19n90b3vKW3rFxH5YPkuPVT9WtcMV4mWxlvNqd7Kia+vQV/6pVX7B7iBtMg587auhzUqMvAl1vrhA2zgtjDs6Fc1+4Qc1zPiBhYQOoZeZ5TbDUliNbdk= knoldus@shivani-mehrotra"

}

resource "aws_instance" "instance" {
  ami                         = "ami-051d99278ba9fdc66"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  // ami                         = data.aws_ami.ubuntu.id
  key_name                    = "key-test"

  tags = {
    Name = "Playground-1"
  }
}



#------------------------------------------------------------------------------

data "aws_ami" "ubuntu-ami" {
  most_recent = true
  owners = ["838487617183"]
  // filter {
  //   name   = "name"
  //   values = ["ami-051d99278ba9fdc66"]
  // }

  // filter {
  //   name   = "virtualization-type"
  //   values = ["hvm"]
  // }

  
}


resource "aws_instance" "instance-1" {
  // ami                         = "ami-051d99278ba9fdc66"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  ami                         = data.aws_ami.ubuntu-ami.id
  key_name                    = "key-test"

  tags = {
    Name = "Playground-2"
  }
}