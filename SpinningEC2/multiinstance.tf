resource "aws_instance" "xeninstance" {
    ami = "ami-0a4a70bd98c6d6441"
    instance_type   = "t2.micro"
    count       = 4
}
