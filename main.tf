# Create VPC
resource "alicloud_vpc" "vpc" {
  vpc_name   = var.vpc_config.vpc_name
  cidr_block = var.vpc_config.cidr_block
}

# Create VSwitch
resource "alicloud_vswitch" "vswitch" {
  vpc_id       = alicloud_vpc.vpc.id
  zone_id      = var.vswitch_config.zone_id
  cidr_block   = var.vswitch_config.cidr_block
  vswitch_name = var.vswitch_config.vswitch_name
}

# Create Security Group
resource "alicloud_security_group" "security_group" {
  vpc_id              = alicloud_vpc.vpc.id
  security_group_name = var.security_group_config.security_group_name
  description         = var.security_group_config.description
}

# Create RDS Instance
resource "alicloud_db_instance" "rds_instance" {
  engine                   = var.rds_instance_config.engine
  instance_storage         = var.rds_instance_config.instance_storage
  engine_version           = var.rds_instance_config.engine_version
  security_ips             = var.rds_instance_config.security_ips
  vpc_id                   = alicloud_vpc.vpc.id
  zone_id                  = var.rds_instance_config.zone_id
  vswitch_id               = alicloud_vswitch.vswitch.id
  instance_charge_type     = var.rds_instance_config.instance_charge_type
  instance_type            = var.rds_instance_config.instance_type
  category                 = var.rds_instance_config.category
  db_instance_storage_type = var.rds_instance_config.db_instance_storage_type
  instance_name            = var.rds_instance_config.instance_name
}

# Create Database
resource "alicloud_db_database" "database" {
  character_set  = var.database_config.character_set
  instance_id    = alicloud_db_instance.rds_instance.id
  data_base_name = var.database_config.name
  description    = var.database_config.description
}

# Create Database Account
resource "alicloud_db_account" "default" {
  db_instance_id      = alicloud_db_instance.rds_instance.id
  account_name        = var.db_account_config.account_name
  account_password    = var.db_account_config.account_password
  account_type        = var.db_account_config.account_type
  account_description = var.db_account_config.description
}