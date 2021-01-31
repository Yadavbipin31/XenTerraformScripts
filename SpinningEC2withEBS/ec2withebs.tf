##EC2 info
resource "aws_instance" "xen" {
    ami =   "ami-0dba2cb6798deb6d8"
    instance_type   =   "t2.micro"
    availability_zone   =   "us-east-1a"
    key_name    = "xenkp"
}

##EBS Volume info
resource "aws_ebs_volume" "ebs-volume-1" {
    availability_zone   = "us-east-1a"
    size    =   5
    type    =   "gp2"
    tags    = {
        key_name    = "Extra Volume for EC2"
    }
}

##Attaching AWS Services
resource "aws_volume_attachment" "ebs-volume-1-attachment" {
    device_name = "/dev/xvdh"
    volume_id   = aws_ebs_volume.ebs-volume-1.id
    instance_id = aws_instance.xen.id
}