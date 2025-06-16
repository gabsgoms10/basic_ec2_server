provider "aws" {
    region = "us-east-1"
}

resource "aws_vpc" "central_vpc"{
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "development_vpc"
    }
}

resource "aws_subnet" "subnet_1"{
    vpc_id = aws_vpc.central_vpc.id
    cidr_block = "10.0.1.0/24"
    tags = {
        Name = "development_subnet"
    }
}

