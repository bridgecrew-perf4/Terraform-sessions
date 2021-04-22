resource "aws_security_group" "first_sg" {
  name        = "Web"
  description = "This sg is for a web"
 # subnet_id needs here , if using NOT DEFAULT vpc.
  
  tags = {
    Name = "Web-SG"
  }
}

  resource "aws_security_group_rule" "web_ingress" {
    count = length(var.web_sg_tcp_ports) # the value is 3 because this variable has 3 ports open
    # 3 how many ports are open, can be number in count
    type = "ingress"
    protocol = "tcp"
    security_group_id = aws_security_group.first_sg.id
    from_port = element(var.web_sg_tcp_ports, count.index) # from-to are same
    to_port = element(var.web_sg_tcp_ports, count.index)
    cidr_blocks = [element(var.web_sg_tcp_ports_cidr, count.index)] # passing different cidr_blocks 
    #if cidr_block is same just give [0.0.0.0/0] 
  }
