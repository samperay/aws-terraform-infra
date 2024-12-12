resource "aws_security_group" "jenkins-server-sg" {
  description = "jenkins-sg"
  name        = "jenkins-server-sg"
  vpc_id      = aws_vpc.jenkins-vpc.id

  tags = merge(local.common_tags, {
    Name = "jenkins-server-sg"
  })

}

resource "aws_vpc_security_group_ingress_rule" "allow_jenkins_traffic" {
  security_group_id = aws_security_group.jenkins-server-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 8080
  ip_protocol       = "tcp"
  to_port           = 8080

  tags = {
    name = "allow_jenkins_traffic"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_traffic" {
  security_group_id = aws_security_group.jenkins-server-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22

  tags = {
    name = "allow_ssh_traffic"
  }
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.jenkins-server-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports


  tags = merge(local.common_tags, {
    Name = "jenkins-server-sg"
  })
}

