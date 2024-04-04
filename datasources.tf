data "aws_ssm_parameter" "rds_database_password" {
  name = var.ssm_parameter_db_password
}