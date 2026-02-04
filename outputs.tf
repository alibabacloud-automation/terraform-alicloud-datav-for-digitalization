# VPC outputs
output "vpc_id" {
  description = "The ID of the VPC"
  value       = alicloud_vpc.vpc.id
}

output "vpc_name" {
  description = "The name of the VPC"
  value       = alicloud_vpc.vpc.vpc_name
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = alicloud_vpc.vpc.cidr_block
}

# VSwitch outputs
output "vswitch_id" {
  description = "The ID of the VSwitch"
  value       = alicloud_vswitch.vswitch.id
}

output "vswitch_name" {
  description = "The name of the VSwitch"
  value       = alicloud_vswitch.vswitch.vswitch_name
}

output "vswitch_cidr_block" {
  description = "The CIDR block of the VSwitch"
  value       = alicloud_vswitch.vswitch.cidr_block
}

output "vswitch_zone_id" {
  description = "The zone ID of the VSwitch"
  value       = alicloud_vswitch.vswitch.zone_id
}

# Security Group outputs
output "security_group_id" {
  description = "The ID of the Security Group"
  value       = alicloud_security_group.security_group.id
}

output "security_group_name" {
  description = "The name of the Security Group"
  value       = alicloud_security_group.security_group.security_group_name
}

# RDS Instance outputs
output "rds_instance_id" {
  description = "The ID of the RDS instance"
  value       = alicloud_db_instance.rds_instance.id
}

output "rds_instance_name" {
  description = "The name of the RDS instance"
  value       = alicloud_db_instance.rds_instance.instance_name
}

output "rds_instance_connection_string" {
  description = "The internal connection string of the RDS instance"
  value       = alicloud_db_instance.rds_instance.connection_string
}

output "rds_instance_port" {
  description = "The internal port of the RDS instance"
  value       = alicloud_db_instance.rds_instance.port
}

output "rds_instance_engine" {
  description = "The engine type of the RDS instance"
  value       = alicloud_db_instance.rds_instance.engine
}

output "rds_instance_engine_version" {
  description = "The engine version of the RDS instance"
  value       = alicloud_db_instance.rds_instance.engine_version
}

# Database outputs
output "database_name" {
  description = "The name of the database"
  value       = alicloud_db_database.database.data_base_name
}

output "database_character_set" {
  description = "The character set of the database"
  value       = alicloud_db_database.database.character_set
}

# Database Account outputs
output "db_account_name" {
  description = "The name of the database account"
  value       = alicloud_db_account.default.account_name
}

output "db_account_type" {
  description = "The type of the database account"
  value       = alicloud_db_account.default.account_type
}