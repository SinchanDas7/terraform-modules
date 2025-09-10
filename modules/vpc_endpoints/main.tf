resource "aws_vpc_endpoint" "this" {
  for_each       = var.endpoints
  vpc_id         = var.vpc_id
  service_name   = "com.amazonaws.us-east-1.${each.value.service}"
  vpc_endpoint_type = each.value.type

  subnet_ids         = each.value.subnet_ids
  security_group_ids = each.value.security_group_ids
  route_table_ids    = each.value.route_table_ids

  private_dns_enabled = each.value.private_dns_enabled

  tags = merge({
    Name = "${each.key}-vpc-endpoint"
  }, each.value.tags)
}
