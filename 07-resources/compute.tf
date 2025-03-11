resource "aws_instance" "ec2" {
  # Ubuntu AMI ID = ami-0c1907b6d738188e5
  # NGINX AMI ID = ami-015c805cace6e65db
  ami                         = "ami-015c805cace6e65db"
  associate_public_ip_address = true
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.public_http_traffic.id]

  tags = merge(local.common_tags, {
    Name = "07-resources-ec2"
  })

  lifecycle {
    create_before_destroy = true
    # ignore_changes = [ tags ]
  }
}

resource "aws_security_group" "public_http_traffic" {
  description = "Security group allowing traffic on ports 80 and 443"
  name        = "public-http-traffic"
  vpc_id      = aws_vpc.vpc.id

  tags = merge(local.common_tags, {
    Name = "07-resources-sg"
  })
}

resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.public_http_traffic.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}
resource "aws_vpc_security_group_ingress_rule" "https" {
  security_group_id = aws_security_group.public_http_traffic.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
}