resource "aws_lb" "public_lb" {
  name               = "${var.ENV}-alb-public"
  internal           = false
  load_balancer_type = "application"
#  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = data.terraform_remote_state.vpc.outputs.public_subnet
  enable_deletion_protection = true

  tags = {
    Environment = "${var.ENV}-alb-public"
  }
}

resource "aws_lb" "private_lb" {
  name               = "${var.ENV}-alb-private"
  internal           = false
  load_balancer_type = "application"
  #  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = data.terraform_remote_state.vpc.outputs.private_subnet
  enable_deletion_protection = true

  tags = {
    Environment = "${var.ENV}-alb-private"
  }
}