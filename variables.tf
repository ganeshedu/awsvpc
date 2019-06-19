variable "aws-region" {
  description = "The aws regions to create the infrastructure"
  default   = "us-east-1"
}

#variable "vpc_id" {
#default = "vpc-terraform-test"
#}

variable "VPCCidrBlock" {
  default = "10.0.0.0/16"
}

#variable "subnet_id" {
# default = "subnet-terraform-test"
#}
variable "SubnetCidrBlock" {
  default = "10.0.1.0/24"
}

variable "aws-ami" {
  default   = "ami-2757f631"
}
variable "instance_type" {
  default= "t2.micro"
}
variable "name" {
  default= "TF-EC2-Instance"
}
