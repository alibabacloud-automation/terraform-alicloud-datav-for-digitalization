# Configure the Alibaba Cloud Provider
provider "alicloud" {
  region = var.region
}

# Random ID for resource naming
resource "random_id" "suffix" {
  byte_length = 8
}

# Data source to query available zones for RDS
data "alicloud_db_zones" "zones_ids" {
  engine                   = var.rds_engine
  engine_version           = var.rds_engine_version
  instance_charge_type     = "PostPaid"
  category                 = var.rds_category
  db_instance_storage_type = var.rds_storage_type
}

# Local variables
locals {
  common_name      = "${var.name_prefix}-${random_id.suffix.hex}"
  selected_zone_id = data.alicloud_db_zones.zones_ids.ids[0]
}

# Call the DataV for Digitalization module
module "datav_for_digitalization" {
  source = "../../"

  # VPC configuration
  vpc_config = {
    vpc_name   = "${local.common_name}-vpc"
    cidr_block = var.vpc_cidr_block
  }

  # VSwitch configuration
  vswitch_config = {
    zone_id      = local.selected_zone_id
    cidr_block   = var.vswitch_cidr_block
    vswitch_name = "${local.common_name}-vswitch"
  }

  # Security Group configuration
  security_group_config = {
    security_group_name = "${local.common_name}-sg"
    description         = "Security group for DataV digitalization solution"
  }

  # RDS Instance configuration
  rds_instance_config = {
    engine                   = var.rds_engine
    instance_storage         = var.rds_instance_storage
    engine_version           = var.rds_engine_version
    security_ips             = [var.vpc_cidr_block]
    zone_id                  = local.selected_zone_id
    instance_charge_type     = var.rds_instance_charge_type
    instance_type            = var.rds_instance_type
    category                 = var.rds_category
    db_instance_storage_type = var.rds_storage_type
    instance_name            = "${local.common_name}-rds"
  }

  # Database configuration
  database_config = {
    character_set = var.database_character_set
    name          = var.database_name
    description   = "Database for DataV digitalization solution"
  }

  # Database Account configuration
  db_account_config = {
    account_name     = var.db_account_name
    account_password = var.db_password
    account_type     = var.db_account_type
    description      = "Database account for DataV digitalization solution"
  }
}