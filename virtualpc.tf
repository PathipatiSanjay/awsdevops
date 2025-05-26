resource "aws_vpc" "first_vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "first_vpc"
    }
  
}

resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.first_vpc.id
    cidr_block = "10.0.0.0/20"
  
}

resource "aws_subnet" "pribvate_subnet" {
    vpc_id = aws_vpc.first_vpc.id
    cidr_block = "10.0.16.0/20"
  
}

resource "aws_internet_gateway" "My_IGW" {
    vpc_id = aws_vpc.first_vpc.id
    tags = {
      Name = "my_IGW"
    }
  
}

resource "aws_route_table" "publicRT" {
    vpc_id = aws_vpc.first_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.My_IGW.id
    }
}

resource "aws_route_table_association" "publicRTassociation" {
    subnet_id = aws_subnet.public_subnet.id
    route_table_id = aws_route_table.publicRT.id

}

  
