output "alb_private" {
  value = aws_lb.private.id
}
output "alb_public" {
  value = aws_lb.public.id
}

output "alb_private_arn" {
  value = aws_lb.private.arn
}

output "alb_public_arn" {
  value = aws_lb.public.arn
}
output "listner_private_arn" {
  value = aws_lb_listener.listner_private.arn
}