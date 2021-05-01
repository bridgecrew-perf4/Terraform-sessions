resource "aws_vpc" "task-vpc" {
  cidr_block       = var.vpc_cidr_block


  tags = {
    Name = "${var.env}-vpc"
    // Project = var.project_name
    Environment = var.env
    
  }
}
############## Internet-Gateway  ##################


resource "aws_internet_gateway" "internet-gateway" {
  vpc_id = aws_vpc.task-vpc.id

 tags = {
    Name = "${var.env}-ig"
    Project = var.project_name
    Environment = var.env
    
  }
} 


########## Public Route Table ############

resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.task-vpc.id
  route {
    cidr_block = var.cidr_block
    gateway_id = aws_internet_gateway.internet-gateway.id
  }

  tags = {
    Name = "${var.env}-public-routetable"
    Project = var.project_name
    Environment = var.env
    
  }
} 

// ####### Public Subnet ############

resource "aws_subnet" "public-subnet-1" {
  vpc_id     = aws_vpc.task-vpc.id
  cidr_block = var.cidr_block_public_subnet1

  tags = {
    Name = "${var.env}-public-subnet-1"
    Project = var.project_name
    Environment = var.env
    
  }

}

resource "aws_subnet" "public-subnet-2" {
  vpc_id     = aws_vpc.task-vpc.id
  cidr_block = var.cidr_block_public_subnet2

  tags = {
    Name = "${var.env}-public-subnet-2"
    Project = var.project_name
    Environment = var.env
    
  }

}

resource "aws_subnet" "public-subnet-3" {
  vpc_id     = aws_vpc.task-vpc.id
  cidr_block = var.cidr_block_public_subnet3

  tags = {
    Name = "${var.env}-public-subnet-3"
    Project = var.project_name
    Environment = var.env
    
  }

}



######### Public-route_table_association #########

resource "aws_route_table_association" "public-subnet-1" {
  subnet_id      = aws_subnet.public-subnet-1.id
  route_table_id = aws_route_table.public-route-table.id
}

resource "aws_route_table_association" "public-subnet-2" {
  subnet_id      = aws_subnet.public-subnet-2.id
  route_table_id = aws_route_table.public-route-table.id
}

resource "aws_route_table_association" "public-subnet-3" {
  subnet_id      = aws_subnet.public-subnet-3.id
  route_table_id = aws_route_table.public-route-table.id
}

########## Elasitc Ip #############

resource "aws_eip" "elastic_ip" {
  vpc      = true
  tags = {
    Name = "${var.env}-elastic-ip"
    Project = var.project_name
    Environment = var.env
    
  }

}


########## Private Route Table ############

resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.task-vpc.id
  route {
  cidr_block = var.cidr_block
  nat_gateway_id = aws_nat_gateway.task-nat-gw.id
  }
  tags = {
    Name = "${var.env}-private-routetable"
    Project = var.project_name
    Environment = var.env
    
  }
} 

resource "aws_subnet" "private-subnet-1" {
  vpc_id     = aws_vpc.task-vpc.id
  cidr_block = var.cidr_block_private_subnet1

  tags = {
    Name = "${var.env}-private-subnet-1"
    Project = var.project_name
    Environment = var.env
    
  }

}

resource "aws_subnet" "private-subnet-2" {
  vpc_id     = aws_vpc.task-vpc.id
  cidr_block = var.cidr_block_private_subnet2

  tags = {
    Name = "${var.env}-private-subnet-2"
    Project = var.project_name
    Environment = var.env
    
  }

}

resource "aws_subnet" "private-subnet-3" {
  vpc_id     = aws_vpc.task-vpc.id
  cidr_block = var.cidr_block_private_subnet3

  tags = {
    Name = "${var.env}-private-subnet-3"
    Project = var.project_name
    Environment = var.env
    
  }

}

// ########## Private Route Table Association ##############

resource "aws_route_table_association" "private-subnet-1" {
  subnet_id      = aws_subnet.private-subnet-1.id
  route_table_id = aws_route_table.private-route-table.id
}

resource "aws_route_table_association" "private-subnet-2" {
  subnet_id      = aws_subnet.private-subnet-2.id
  route_table_id = aws_route_table.private-route-table.id
}

resource "aws_route_table_association" "private-subnet-3" {
  subnet_id      = aws_subnet.private-subnet-3.id
  route_table_id = aws_route_table.private-route-table.id
}

############ NAT GATEWAY #########

resource "aws_nat_gateway" "task-nat-gw" {
  allocation_id = aws_eip.elastic_ip.id
  subnet_id     = aws_subnet.public-subnet-1.id
  tags = {
    Name = "${var.env}-task-nat-gw"
    Project = var.project_name
    Environment = var.env
    
  }

}