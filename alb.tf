resource "aws_alb" "alb" {
  name            = "alb"
  internal        = false
  security_groups = ["${aws_security_group.alb-sg.id}"]
  subnets         = [
    aws_subnet.public_1a.id,
    aws_subnet.public_1b.id
  ]

  access_logs {
    bucket  = aws_s3_bucket.alb.id
    prefix  = "frontend-alb"
    enabled = true
  }

  tags = {
    Name = "ALB"
  }


  lifecycle { create_before_destroy = true }
}



resource "aws_alb_target_group" "frontend" {
  name     = "frontend-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.dev.id

  health_check {
    interval            = 30
    path                = "/"
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }

  tags = { Name = "Frontend Target Group" }
}

resource "aws_alb_target_group_attachment" "frontend" {
  target_group_arn = aws_alb_target_group.frontend.arn
  target_id        = aws_instance.vm1.id
  port             = 80
}

resource "aws_alb_target_group_attachment" "frontend_1b" {
  target_group_arn = aws_alb_target_group.frontend.arn
  target_id        = aws_instance.vm2.id
  port             = 80
}


resource "aws_alb_listener" "http" {
  load_balancer_arn = aws_alb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.frontend.arn
    type             = "forward"
  }
}