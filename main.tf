# Configure the AWS Provider
provider "aws" {
  profile = "default"
  region     = "${var.aws-region}"
}

# Create a VPC:
resource "aws_vpc" "tf_vpc" {
    #vpc_id = "${var.vpc_id}"
    cidr_block = "${var.VPCCidrBlock}"
    tags = {
      Name = "terraform_vpc"
    }
}

# Create a subnet
resource "aws_subnet" "tf_subnet" {
  vpc_id = "${aws_vpc.tf_vpc.id}"
  #subnet_id = "${var.subnet_id}"
  cidr_block = "${var.SubnetCidrBlock}"
  tags = {
      Name = "terraform_subnet"
    }
}

# create Network Interface
resource "aws_network_interface" "tf_interface" {
subnet_id = "${aws_subnet.tf_subnet.id}"
  tags = {
      Name = "terraform_interface"
    }
}

# Create a web server
resource "aws_instance" "web" {
  ami	        = "${var.aws-ami}"
  instance_type = "${var.instance_type}"
  #vpc_id = "${aws_vpc.default.id}"
  #subnet_id = "${var.subnet_id}"
  network_interface {
    network_interface_id = "${aws_network_interface.tf_interface.id}"
    device_index = 0
  }
  tags = {
    Name = "${var.name}"
  }
}