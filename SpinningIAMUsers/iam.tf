###Create Users
resource "aws_iam_user" "user1" {
    name    = "Amit"
}
resource "aws_iam_user" "user2" {
    name    = "Tanmayi"
}
resource "aws_iam_user" "user3" {
    name    = "Puru"
}
resource "aws_iam_user" "user4" {
    name    = "Prabhu"
}

### Group 1 Defining
resource "aws_iam_group" "DevOps" {
    name    = "DevOps"
}
resource "aws_iam_group" "Developer" {
    name    = "Developer"
}
resource "aws_iam_group" "Administrators" {
    name    = "Administrators"
}

###Policy Attachment to Groups
resource "aws_iam_policy_attachment" "DevOps-attach" {
    name    = "DevOps-attach"
    groups  = [aws_iam_group.DevOps.name]
    policy_arn  = "arn:aws:iam::aws:policy/AWSCodeDeployFullAccess"
}
resource "aws_iam_policy_attachment" "Developer-attach" {
    name    = "Developer-attach"
    groups  = [aws_iam_group.Developer.name]
    policy_arn  = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}
resource "aws_iam_policy_attachment" "Administrators-attach" {
    name    = "Administrators-attach"
    groups  = [aws_iam_group.Administrators.name]
    policy_arn  = "arn:aws:iam::aws:policy/AdministratorAccess"
}

###Users attachment to Groups
##1st Group Member
resource "aws_iam_group_membership" "DevOps-Users" {
    name    =   "DevOps-Users"
    users   =   [
        aws_iam_user.user1.name,
    ]
    group   =   aws_iam_group.DevOps.name
}
##2nd Group Member
resource "aws_iam_group_membership" "Developer-Users" {
    name    =   "Developer-Users"
    users   =   [
        aws_iam_user.user2.name,
        aws_iam_user.user3.name,
    ]
    group   =   aws_iam_group.Developer.name
}
##3rd Group Member
resource "aws_iam_group_membership" "Administrators-Users" {
    name    =   "Administrators-Users"
    users   =   [
        aws_iam_user.user4.name,
    ]
    group   =   aws_iam_group.Administrators.name
}