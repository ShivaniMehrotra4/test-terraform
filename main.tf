resource "aws_key_pair" "tf-test" {
  key_name    = "tf-test"
  public_key  = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDP351Tx/57OoGvkhGIVOjwdSb0iU7mfN428+mQakXVs2U+EL8DXh8UbEhW9xM+NS/k43p/YNdOT+n27kBPK54yxEe6GFgJHZwlgQDzHSqd/6uIB87E0qs91TZ89qDi20sNgGYkm1wDLqJ6d/Jgu70s5B0MtIv/9UU+dee34EN7G8b4Fwb+3kKKJX+8Zl4of2LKZnS3Xkc17bwmr2EsID9DTKdq3AADIqZFxleqWVYxPaPqiLRGoDUpZt0grZQ2M7tDGhpzVP18F9bUYsaR4HjJZC45y1udoXooPAG71Z/na5xYVd8HPHhSGvPYaFgIOyZcccYdYQAHUYL/L20HUJfz8lJg+/LzZMjpp4NOEwUMHrfx6GuWA2c/P9wm5vjXZdSLHjCGMPdskOe19n90b3vKW3rFxH5YPkuPVT9WtcMV4mWxlvNqd7Kia+vQV/6pVX7B7iBtMg587auhzUqMvAl1vrhA2zgtjDs6Fc1+4Qc1zPiBhYQOoZeZ5TbDUliNbdk= knoldus@shivani-mehrotra"
  count       = 1

  // public_key = file("/home/knoldus/.ssh/id_rsa_gitlab.pub")
}

resource "aws_instance" "instance" {
  ami                         = "ami-051d99278ba9fdc66"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  key_name                    = "tf-test"
  count                       = 1
  // count                       = var.already_exists == "no" ? 1 : 1

  tags = {
    Name = "Playground-1"
  }
}
