variable "vpc_config" {
  type = object({
    vpc_name   = optional(string, null)
    cidr_block = string
  })
  description = "Configuration for VPC. The cidr_block is required."
  default = {
    vpc_name   = "datav-vpc"
    cidr_block = "192.168.0.0/16"
  }
}

variable "vswitch_config" {
  type = object({
    zone_id      = string
    cidr_block   = string
    vswitch_name = optional(string, null)
  })
  description = "Configuration for VSwitch. The zone_id and cidr_block are required."
  default = {
    zone_id      = null
    cidr_block   = "192.168.0.0/24"
    vswitch_name = "datav-vswitch"
  }
}

variable "security_group_config" {
  type = object({
    security_group_name = optional(string, null)
    description         = optional(string, null)
  })
  description = "Configuration for Security Group"
  default = {
    security_group_name = "datav-sg"
    description         = "Security group for DataV digitalization solution"
  }
}

variable "rds_instance_config" {
  type = object({
    engine                   = string
    instance_storage         = number
    engine_version           = string
    security_ips             = list(string)
    zone_id                  = string
    instance_charge_type     = string
    instance_type            = string
    category                 = string
    db_instance_storage_type = string
    instance_name            = optional(string, null)
  })
  description = "Configuration for RDS instance. The engine, instance_storage, engine_version, security_ips, zone_id, instance_charge_type, instance_type, category, db_instance_storage_type are required."
  default = {
    engine                   = "MySQL"
    instance_storage         = 40
    engine_version           = "8.0"
    security_ips             = ["192.168.0.0/16"]
    zone_id                  = null
    instance_name            = "datav-rds"
    instance_charge_type     = "Postpaid"
    instance_type            = "mysql.n2.medium.1"
    category                 = "Basic"
    db_instance_storage_type = "cloud_essd"
  }
}

variable "database_config" {
  type = object({
    character_set = string
    name          = string
    description   = optional(string, null)
  })
  description = "Configuration for database. The character_set and name are required."
  default = {
    character_set = "utf8"
    name          = "mysqltest"
  }
}

variable "db_account_config" {
  type = object({
    account_name     = string
    account_password = string
    account_type     = string
    description      = optional(string, null)
  })
  description = "Configuration for database account. The account_name, account_password, account_type are required."
  default = {
    account_name     = "user_test"
    account_password = null
    account_type     = "Super"
  }
}