variable "region" {
  type        = string
  description = "The region where resources will be created"
  default     = "cn-shenzhen"
}

variable "name_prefix" {
  type        = string
  description = "Prefix for resource names"
  default     = "datav-example"
}

# VPC variables
variable "vpc_cidr_block" {
  type        = string
  description = "The CIDR block for the VPC"
  default     = "192.168.0.0/16"
}

variable "vswitch_cidr_block" {
  type        = string
  description = "The CIDR block for the VSwitch"
  default     = "192.168.0.0/24"
}

# RDS variables
variable "rds_engine" {
  type        = string
  description = "The database engine"
  default     = "MySQL"
}

variable "rds_engine_version" {
  type        = string
  description = "The database engine version"
  default     = "8.0"
}

variable "rds_instance_storage" {
  type        = number
  description = "The storage size of RDS instance in GB"
  default     = 40
}

variable "rds_instance_charge_type" {
  type        = string
  description = "The charge type of RDS instance"
  default     = "Postpaid"
}

variable "rds_instance_type" {
  type        = string
  description = "The instance type of RDS"
  default     = "mysql.n2.medium.1"
}

variable "rds_category" {
  type        = string
  description = "The category of RDS instance"
  default     = "Basic"
}

variable "rds_storage_type" {
  type        = string
  description = "The storage type of RDS instance"
  default     = "cloud_essd"
}

# Database variables
variable "database_name" {
  type        = string
  description = "The name of the database"
  default     = "mysqltest"
}

variable "database_character_set" {
  type        = string
  description = "The character set of the database"
  default     = "utf8"
}

# Database Account variables
variable "db_account_name" {
  type        = string
  description = "The name of the database account"
  default     = "user_test"
}

variable "db_password" {
  type        = string
  description = "The password of the database account"
  sensitive   = true
}

variable "db_account_type" {
  type        = string
  description = "The type of the database account"
  default     = "Super"
}