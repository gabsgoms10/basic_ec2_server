provider "aws" {
    region = "us-east-1"
}

resource "aws_vpc" "sample_vpc"{
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "development_vpc"
    }
}

resource "aws_internet_gateway" "sample_internet_gateway"{
    vpc_id = aws_vpc.sample_vpc.id
    tags = {
        Name = "development_internet_gateway"
    }
}


resource "aws_route_table" "sample_route_table"{
    vpc_id = aws_vpc.sample_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.sample_internet_gateway.id
    }

    tags = {
        Name = "development_route_table "
    }

}

resource "aws_subnet" "subnet_1"{
    vpc_id = aws_vpc.sample_vpc.id
    cidr_block = "10.0.1.0/24"
    tags = {
        Name = "development_subnet"
    }
}

resource "aws_route_table_association" "route_with_subnet" {
    subnet_id =  aws_subnet.subnet_1.id 
    route_table_id = aws_route_table.sample_route_table.id

}