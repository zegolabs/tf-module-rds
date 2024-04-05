# TF MODULE RDS
A Terraform module to create RDS instances

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_db_instance.db](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) | resource |
| [aws_db_parameter_group.postgres12](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_parameter_group) | resource |
| [aws_db_parameter_group.postgres15](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_parameter_group) | resource |
| [aws_db_parameter_group.postgres16](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_parameter_group) | resource |
| [aws_db_subnet_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | resource |
| [aws_ssm_parameter.rds_database_password](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_db_additional_tags"></a> [db\_additional\_tags](#input\_db\_additional\_tags) | Additional tags for the RDS instance | `map(string)` | `{}` | no |
| <a name="input_db_allocated_storage"></a> [db\_allocated\_storage](#input\_db\_allocated\_storage) | The amount of storage to allocate to the RDS instance | `number` | n/a | yes |
| <a name="input_db_engine_version"></a> [db\_engine\_version](#input\_db\_engine\_version) | The engine version of the RDS instance | `string` | n/a | yes |
| <a name="input_db_enhanced_monitoring_interval"></a> [db\_enhanced\_monitoring\_interval](#input\_db\_enhanced\_monitoring\_interval) | The interval for enhanced monitoring | `number` | `0` | no |
| <a name="input_db_family"></a> [db\_family](#input\_db\_family) | The family of the RDS instance e.g. postgres15 | `string` | n/a | yes |
| <a name="input_db_instance_class"></a> [db\_instance\_class](#input\_db\_instance\_class) | The instance class of the RDS instance | `string` | n/a | yes |
| <a name="input_db_instance_name"></a> [db\_instance\_name](#input\_db\_instance\_name) | The name of the RDS instance | `string` | n/a | yes |
| <a name="input_db_multi_az"></a> [db\_multi\_az](#input\_db\_multi\_az) | Whether the RDS instance is multi-AZ | `bool` | n/a | yes |
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | The name of the database | `string` | n/a | yes |
| <a name="input_db_performance_insights"></a> [db\_performance\_insights](#input\_db\_performance\_insights) | Whether performance insights is enabled | `bool` | n/a | yes |
| <a name="input_db_security_groups"></a> [db\_security\_groups](#input\_db\_security\_groups) | The security groups for the RDS instance | `list(string)` | n/a | yes |
| <a name="input_db_subnet_group_override"></a> [db\_subnet\_group\_override](#input\_db\_subnet\_group\_override) | The subnet group name for the RDS instance | `string` | `""` | no |
| <a name="input_db_subnet_ids"></a> [db\_subnet\_ids](#input\_db\_subnet\_ids) | The subnet IDs for the RDS instance | `list(string)` | n/a | yes |
| <a name="input_db_username"></a> [db\_username](#input\_db\_username) | The username for the RDS instance | `string` | n/a | yes |
| <a name="input_environment_name"></a> [environment\_name](#input\_environment\_name) | The name of the environment | `string` | n/a | yes |
| <a name="input_environment_shortname"></a> [environment\_shortname](#input\_environment\_shortname) | The short name of the environment | `string` | n/a | yes |
| <a name="input_pg_stat_statements_max"></a> [pg\_stat\_statements\_max](#input\_pg\_stat\_statements\_max) | The maximum number of pg\_stat\_statements entries | `string` | `"5000"` | no |
| <a name="input_pg_stat_statements_track"></a> [pg\_stat\_statements\_track](#input\_pg\_stat\_statements\_track) | The track level for pg\_stat\_statements | `string` | `"TOP"` | no |
| <a name="input_ssm_parameter_db_password"></a> [ssm\_parameter\_db\_password](#input\_ssm\_parameter\_db\_password) | The name of the SSM parameter for the RDS password | `string` | n/a | yes |
| <a name="input_track_activity_query_size"></a> [track\_activity\_query\_size](#input\_track\_activity\_query\_size) | The size of the track\_activity\_query\_size | `string` | `"4096"` | no |
| <a name="input_zego_managed_from_tag"></a> [zego\_managed\_from\_tag](#input\_zego\_managed\_from\_tag) | The URL of the github repo for tagging resources | `string` | n/a | yes |
| <a name="input_zego_service_name_tag"></a> [zego\_service\_name\_tag](#input\_zego\_service\_name\_tag) | The name of the service for tagging resources | `string` | n/a | yes |

## Outputs

No outputs.
