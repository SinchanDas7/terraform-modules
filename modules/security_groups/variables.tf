variable "vpc_id" {
  description = "VPC ID where the security groups will be created"
  type        = string
}

variable "security_groups" {
  description = <<-EOT
Map of security group definitions:

{
  "web-sg" = {
    description = "Web servers"
    ingress = [
      { from_port = 80, to_port = 80, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] }
    ]
    egress = [
      { from_port = 0, to_port = 0, protocol = "-1", cidr_blocks = ["0.0.0.0/0"] }
    ]
    tags = { Name = "web-sg" }
  }
}
EOT
  type = map(object({
    description = string
    ingress     = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    }))
    egress      = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    }))
    tags = optional(map(string), {})
  }))
}
