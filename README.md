Alicloud DataV for Digitalization Solution Terraform Module

# terraform-alicloud-datav-for-digitalization

English | [简体中文](https://github.com/alibabacloud-automation/terraform-alicloud-datav-for-digitalization/blob/main/README-CN.md)

Terraform module which creates infrastructure for DataV digitalization solution on Alibaba Cloud. This module implements the solution [Quickly build a large screen of enterprise management](https://www.aliyun.com/solution/tech-solution/datav-for-digitalization), involving the deployment of resources such as Virtual Private Cloud (VPC), Virtual Switch (VSwitch), RDS database (RDS) and related components.

## Usage

This module creates the complete infrastructure stack required for DataV digitalization solution, including VPC, VSwitch, Security Group, RDS MySQL instance, database, and database account. All resources are configured with best practices for enterprise management dashboard scenarios.

```terraform
module "datav_for_digitalization" {
  source = "alibabacloud-automation/datav-for-digitalization/alicloud"

  common_name = "my-datav-solution"

  # VPC configuration
  vpc_config = {
    vpc_name   = "datav-vpc"
    cidr_block = "192.168.0.0/16"
  }

  # VSwitch configuration
  vswitch_config = {
    cidr_block   = "192.168.0.0/24"
    vswitch_name = "datav-vswitch"
  }

  # Security Group configuration
  security_group_config = {
    security_group_name = "datav-sg"
    description         = "Security group for DataV solution"
  }

  # RDS Instance configuration
  rds_instance_config = {
    engine                   = "MySQL"
    instance_storage         = 40
    engine_version           = "8.0"
    security_ips             = ["192.168.0.0/16"]
    instance_charge_type     = "Postpaid"
    instance_type            = "mysql.n2.medium.1"
    category                 = "Basic"
    db_instance_storage_type = "cloud_essd"
    instance_name            = "datav-rds"
  }

  # Database configuration
  database_config = {
    character_set = "utf8"
    name          = "mysqltest"
    description   = "Database for DataV solution"
  }

  # Database Account configuration
  db_account_config = {
    account_name     = "user_test"
    account_password = "YourSecurePassword123!"
    account_type     = "Super"
    description      = "Database account for DataV solution"
  }
}
```

## Examples

* [Complete Example](https://github.com/alibabacloud-automation/terraform-alicloud-datav-for-digitalization/tree/main/examples/complete)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.120.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | >= 1.120.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [alicloud_db_account.default](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/db_account) | resource |
| [alicloud_db_database.database](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/db_database) | resource |
| [alicloud_db_instance.rds_instance](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/db_instance) | resource |
| [alicloud_security_group.security_group](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/security_group) | resource |
| [alicloud_vpc.vpc](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/vpc) | resource |
| [alicloud_vswitch.vswitch](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/vswitch) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_database_config"></a> [database\_config](#input\_database\_config) | Configuration for database. The character\_set and name are required. | <pre>object({<br/>    character_set = string<br/>    name          = string<br/>    description   = optional(string, null)<br/>  })</pre> | <pre>{<br/>  "character_set": "utf8",<br/>  "name": "mysqltest"<br/>}</pre> | no |
| <a name="input_db_account_config"></a> [db\_account\_config](#input\_db\_account\_config) | Configuration for database account. The account\_name, account\_password, account\_type are required. | <pre>object({<br/>    account_name     = string<br/>    account_password = string<br/>    account_type     = string<br/>    description      = optional(string, null)<br/>  })</pre> | <pre>{<br/>  "account_name": "user_test",<br/>  "account_password": null,<br/>  "account_type": "Super"<br/>}</pre> | no |
| <a name="input_rds_instance_config"></a> [rds\_instance\_config](#input\_rds\_instance\_config) | Configuration for RDS instance. The engine, instance\_storage, engine\_version, security\_ips, zone\_id, instance\_charge\_type, instance\_type, category, db\_instance\_storage\_type are required. | <pre>object({<br/>    engine                   = string<br/>    instance_storage         = number<br/>    engine_version           = string<br/>    security_ips             = list(string)<br/>    zone_id                  = string<br/>    instance_charge_type     = string<br/>    instance_type            = string<br/>    category                 = string<br/>    db_instance_storage_type = string<br/>    instance_name            = optional(string, null)<br/>  })</pre> | <pre>{<br/>  "category": "Basic",<br/>  "db_instance_storage_type": "cloud_essd",<br/>  "engine": "MySQL",<br/>  "engine_version": "8.0",<br/>  "instance_charge_type": "Postpaid",<br/>  "instance_name": "datav-rds",<br/>  "instance_storage": 40,<br/>  "instance_type": "mysql.n2.medium.1",<br/>  "security_ips": [<br/>    "192.168.0.0/16"<br/>  ],<br/>  "zone_id": null<br/>}</pre> | no |
| <a name="input_security_group_config"></a> [security\_group\_config](#input\_security\_group\_config) | Configuration for Security Group | <pre>object({<br/>    security_group_name = optional(string, null)<br/>    description         = optional(string, null)<br/>  })</pre> | <pre>{<br/>  "description": "Security group for DataV digitalization solution",<br/>  "security_group_name": "datav-sg"<br/>}</pre> | no |
| <a name="input_vpc_config"></a> [vpc\_config](#input\_vpc\_config) | Configuration for VPC. The cidr\_block is required. | <pre>object({<br/>    vpc_name   = optional(string, null)<br/>    cidr_block = string<br/>  })</pre> | <pre>{<br/>  "cidr_block": "192.168.0.0/16",<br/>  "vpc_name": "datav-vpc"<br/>}</pre> | no |
| <a name="input_vswitch_config"></a> [vswitch\_config](#input\_vswitch\_config) | Configuration for VSwitch. The zone\_id and cidr\_block are required. | <pre>object({<br/>    zone_id      = string<br/>    cidr_block   = string<br/>    vswitch_name = optional(string, null)<br/>  })</pre> | <pre>{<br/>  "cidr_block": "192.168.0.0/24",<br/>  "vswitch_name": "datav-vswitch",<br/>  "zone_id": null<br/>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_database_character_set"></a> [database\_character\_set](#output\_database\_character\_set) | The character set of the database |
| <a name="output_database_name"></a> [database\_name](#output\_database\_name) | The name of the database |
| <a name="output_db_account_name"></a> [db\_account\_name](#output\_db\_account\_name) | The name of the database account |
| <a name="output_db_account_type"></a> [db\_account\_type](#output\_db\_account\_type) | The type of the database account |
| <a name="output_rds_instance_connection_string"></a> [rds\_instance\_connection\_string](#output\_rds\_instance\_connection\_string) | The internal connection string of the RDS instance |
| <a name="output_rds_instance_engine"></a> [rds\_instance\_engine](#output\_rds\_instance\_engine) | The engine type of the RDS instance |
| <a name="output_rds_instance_engine_version"></a> [rds\_instance\_engine\_version](#output\_rds\_instance\_engine\_version) | The engine version of the RDS instance |
| <a name="output_rds_instance_id"></a> [rds\_instance\_id](#output\_rds\_instance\_id) | The ID of the RDS instance |
| <a name="output_rds_instance_name"></a> [rds\_instance\_name](#output\_rds\_instance\_name) | The name of the RDS instance |
| <a name="output_rds_instance_port"></a> [rds\_instance\_port](#output\_rds\_instance\_port) | The internal port of the RDS instance |
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | The ID of the Security Group |
| <a name="output_security_group_name"></a> [security\_group\_name](#output\_security\_group\_name) | The name of the Security Group |
| <a name="output_vpc_cidr_block"></a> [vpc\_cidr\_block](#output\_vpc\_cidr\_block) | The CIDR block of the VPC |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The ID of the VPC |
| <a name="output_vpc_name"></a> [vpc\_name](#output\_vpc\_name) | The name of the VPC |
| <a name="output_vswitch_cidr_block"></a> [vswitch\_cidr\_block](#output\_vswitch\_cidr\_block) | The CIDR block of the VSwitch |
| <a name="output_vswitch_id"></a> [vswitch\_id](#output\_vswitch\_id) | The ID of the VSwitch |
| <a name="output_vswitch_name"></a> [vswitch\_name](#output\_vswitch\_name) | The name of the VSwitch |
| <a name="output_vswitch_zone_id"></a> [vswitch\_zone\_id](#output\_vswitch\_zone\_id) | The zone ID of the VSwitch |
<!-- END_TF_DOCS -->

## Submit Issues

If you have any problems when using this module, please opening
a [provider issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new) and let us know.

**Note:** There does not recommend opening an issue on this repo.

## Authors

Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com).

## License

MIT Licensed. See LICENSE for full details.

## Reference

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)