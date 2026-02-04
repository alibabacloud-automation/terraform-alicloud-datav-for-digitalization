# VPC outputs
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.datav_for_digitalization.vpc_id
}

output "vpc_name" {
  description = "The name of the VPC"
  value       = module.datav_for_digitalization.vpc_name
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.datav_for_digitalization.vpc_cidr_block
}

# VSwitch outputs
output "vswitch_id" {
  description = "The ID of the VSwitch"
  value       = module.datav_for_digitalization.vswitch_id
}

output "vswitch_name" {
  description = "The name of the VSwitch"
  value       = module.datav_for_digitalization.vswitch_name
}

output "vswitch_cidr_block" {
  description = "The CIDR block of the VSwitch"
  value       = module.datav_for_digitalization.vswitch_cidr_block
}

output "vswitch_zone_id" {
  description = "The zone ID of the VSwitch"
  value       = module.datav_for_digitalization.vswitch_zone_id
}

# Security Group outputs
output "security_group_id" {
  description = "The ID of the Security Group"
  value       = module.datav_for_digitalization.security_group_id
}

output "security_group_name" {
  description = "The name of the Security Group"
  value       = module.datav_for_digitalization.security_group_name
}

# RDS Instance outputs
output "rds_instance_id" {
  description = "The ID of the RDS instance"
  value       = module.datav_for_digitalization.rds_instance_id
}

output "rds_instance_name" {
  description = "The name of the RDS instance"
  value       = module.datav_for_digitalization.rds_instance_name
}

output "rds_instance_connection_string" {
  description = "The internal connection string of the RDS instance"
  value       = module.datav_for_digitalization.rds_instance_connection_string
}

output "rds_instance_port" {
  description = "The internal port of the RDS instance"
  value       = module.datav_for_digitalization.rds_instance_port
}

output "rds_instance_engine" {
  description = "The engine type of the RDS instance"
  value       = module.datav_for_digitalization.rds_instance_engine
}

output "rds_instance_engine_version" {
  description = "The engine version of the RDS instance"
  value       = module.datav_for_digitalization.rds_instance_engine_version
}

# Database outputs
output "database_name" {
  description = "The name of the database"
  value       = module.datav_for_digitalization.database_name
}

output "database_character_set" {
  description = "The character set of the database"
  value       = module.datav_for_digitalization.database_character_set
}

# Database Account outputs
output "db_account_name" {
  description = "The name of the database account"
  value       = module.datav_for_digitalization.db_account_name
}

output "db_account_type" {
  description = "The type of the database account"
  value       = module.datav_for_digitalization.db_account_type
}