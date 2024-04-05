variable "db_instance_name" {
  description = "The name of the RDS instance"
  type        = string
}

variable "environment_shortname" {
  description = "The short name of the environment"
  type        = string
}

variable "db_subnet_ids" {
  description = "The subnet IDs for the RDS instance"
  type        = list(string)
}

variable "db_family" {
  description = "The family of the RDS instance e.g. postgres15"
  type        = string
}

variable "environment_name" {
  description = "The name of the environment"
  type        = string
}

variable "db_name" {
  description = "The name of the database"
  type        = string
}

variable "db_allocated_storage" {
  description = "The amount of storage to allocate to the RDS instance"
  type        = number
}

variable "db_instance_class" {
  description = "The instance class of the RDS instance"
  type        = string
}

variable "db_engine_version" {
  description = "The engine version of the RDS instance"
  type        = string
}

variable "db_username" {
  description = "The username for the RDS instance"
  type        = string
}

variable "db_security_groups" {
  description = "The security groups for the RDS instance"
  type        = list(string)
}

variable "db_subnet_group_override" {
  description = "The subnet group name for the RDS instance"
  type        = string
}

variable "db_multi_az" {
  description = "Whether the RDS instance is multi-AZ"
  type        = bool
}

variable "db_performance_insights" {
  description = "Whether performance insights is enabled"
  type        = bool
}

variable "db_enhanced_monitoring_interval" {
  description = "The interval for enhanced monitoring"
  type        = number
}

variable "db_additional_tags" {
  description = "Additional tags for the RDS instance"
  type        = map(string)
  default     = {}
}

variable "pg_stat_statements_max" {
  description = "The maximum number of pg_stat_statements entries"
  type        = string
  default     = "5000"
}

variable "pg_stat_statements_track" {
  description = "The track level for pg_stat_statements"
  type        = string
  default     = "TOP"
}

variable "track_activity_query_size" {
  description = "The size of the track_activity_query_size"
  type        = string
  default     = "4096"
}

variable "zego_managed_from_tag" {
  description = "The URL of the github repo for tagging resources"
  type        = string
}

variable "zego_service_name_tag" {
  description = "The name of the service for tagging resources"
  type        = string
}

variable "ssm_parameter_db_password" {
  description = "The name of the SSM parameter for the RDS password"
  type        = string
}
