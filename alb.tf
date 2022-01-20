resource "aws_lb" "public" {
  name               = "${var.ENV}-alb-public"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg-public.id]
  subnets            = data.terraform_remote_state.vpc.outputs.public_subnet
  enable_deletion_protection = false

  tags = {
    Environment = "${var.ENV}-alb-public"
  }
}

resource "aws_lb" "private" {
  name               = "${var.ENV}-alb-private"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg-private.id]
  subnets            = data.terraform_remote_state.vpc.outputs.private_subnet
  enable_deletion_protection = true

  tags = {
    Environment = "${var.ENV}-alb-private"
  }
}

