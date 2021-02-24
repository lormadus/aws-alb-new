resource "aws_key_pair" "dev_keyname" {
  key_name   = "david-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDkpRRJtxg+sp540lQewpXpMhxFaSQdlMPz8jm5AB3mcifx/D/NUmpUDrJi9svD54+wtP1t0NmsmsnOMmm1zr2tp6i9oM4Zk105rIXrqS3Admb4Cv1Uve0tNGBf0iInCJwW3BGS1pnvGVyEeiDBIlWl3Tnc/o2snUI+hZZlcoLanBmeebd0V5TJUyeCGRTCMlX0hYYNoMVt1L/MMr//XwOOBz5nY1i/SvQsdD4CnNpKgMuTz1DaJzSuxW30o+XNUSakhdtHGhOnmYFNt0IuXbAgxLxgtbIJJH5e2elV1BNxLWvRKXf0tz7burM5+GNwFffe+j7VXmiQwnVPiopu/XfX ec2-user@ip-172-31-13-159.us-west-1.compute.internal"
}