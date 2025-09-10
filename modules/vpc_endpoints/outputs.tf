output "endpoint_ids" {
  description = "Map of endpoint key to its resource ID"
  value       = { for k, ep in aws_vpc_endpoint.this : k => ep.id }
}

output "endpoint_dns_entries" {
  description = "DNS entries for interface endpoints"
  value       = { for k, ep in aws_vpc_endpoint.this : k => ep.dns_entry }
}
