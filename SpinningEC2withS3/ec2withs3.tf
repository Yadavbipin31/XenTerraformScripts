##EC2 info
resource "aws_instance" "xen" {
    ami =   "ami-0a4a70bd98c6d6441"
    instance_type   =   "t2.micro"
    availability_zone   =   "ap-south-1a"
    key_name    = "xenkey"
}

##Deploying S3 Bucket
resource "aws_s3_bucket" "bucket1" {
    bucket  =   "xen-pict-bucket-xenstack-us-region"
    acl     =   "public-read"
    versioning {
        enabled = true
    }
}
