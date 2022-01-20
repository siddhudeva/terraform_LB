output "alb_private" {
  value = aws_lb.private_lb.id
}
output "alb_public" {
  value = aws_lb.public_lb.id
}
output "alb_public_arn" {
  value = aws_lb.public_lb.arn
}
output "alb_private_arn" {
  value = aws_lb.private_lb.arn
}
output "private_listner_arn" {
  value = aws_lb.private_lb.
}