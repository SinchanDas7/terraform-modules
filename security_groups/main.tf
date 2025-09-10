resource "aws_security_group" "this" {
  for_each    = var.security_groups
  name        = each.key
  description = each.value.description
  vpc_id      = var.vpc_id
  tags        = merge({ Name = each.key }, each.value.tags)
}

resource "aws_security_group_rule" "ingress" {
  for_each = {
    for sg_name, sg in var.security_groups :
    sg_name => [
      for rule in sg.ingress :
      merge(rule, { security_group_id = aws_security_group.this[sg_name].id, type = "ingress" })
    ]
  } |> flatten()

  type              = "ingress"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  cidr_blocks       = each.value.cidr_blocks
  security_group_id = each.value.security_group_id
}

resource "aws_security_group_rule" "egress" {
  for_each = {
    for sg_name, sg in var.security_groups :
    sg_name => [
      for rule in sg.egress :
      merge(rule, { security_group_id = aws_security_group.this[sg_name].id, type = "egress" })
    ]
  } |> flatten()

  type              = "egress"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  cidr_blocks       = each.value.cidr_blocks
  security_group_id = each.value.security_group_id
}
