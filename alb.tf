resource "aws_lb" "public" {
  name               = "${var.ENV}-alb-public"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg-public.id]
  subnets            = data.terraform_remote_state.vpc.outputs.public_subnet
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

  tags = {
    Environment = "${var.ENV}-alb-private"
  }
}
resource "aws_lb_listener" "listner_private" {
  load_balancer_arn = aws_lb.private.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "ok"
      status_code  = "200"
    }
  }
}
