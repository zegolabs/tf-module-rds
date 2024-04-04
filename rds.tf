resource "aws_db_instance" "db" {
  identifier = var.db_instance_name

  db_name              = var.db_name
  allocated_storage    = var.db_allocated_storage
  storage_type         = "gp3"
  engine               = "postgres"
  engine_version       = var.db_engine_version
  instance_class       = var.db_instance_class
  parameter_group_name = "${var.environment_name}-${var.db_name}-${var.db_family}"

  username = var.db_username
  password = data.aws_ssm_parameter.rds_database_password.value ######

  vpc_security_group_ids = var.db_security_groups
  db_subnet_group_name   = var.db_subnet_group_override == "" ? aws_db_subnet_group.this.id : var.db_subnet_group_override

  multi_az            = var.db_multi_az
  storage_encrypted   = true
  publicly_accessible = false
  apply_immediately   = true

  performance_insights_enabled = var.db_performance_insights
  monitoring_interval          = var.db_enhanced_monitoring_interval

  backup_retention_period = 7
  backup_window           = "01:30-02:00"
  maintenance_window      = "Fri:03:00-Fri:03:30"
  copy_tags_to_snapshot   = true

  auto_minor_version_upgrade = false
  deletion_protection        = true # ensures accidental deletion is not possible
  skip_final_snapshot        = false
  final_snapshot_identifier  = "${var.db_instance_name}-${var.environment_shortname}-final" # first char has to be a letter

  tags = merge(var.db_additional_tags, local.common_tags)
}

resource "aws_db_subnet_group" "this" {
  name       = "${var.db_instance_name}-${var.environment_shortname}-group"
  subnet_ids = var.db_subnet_ids

  tags = local.common_tags
}

resource "aws_db_parameter_group" "postgres12" {
  count = var.db_family == "postgres12" ? 1 : 0

  name   = "${var.environment_name}-${var.db_name}-${var.db_family}"
  family = var.db_family

  parameter {
    name         = "rds.force_ssl"
    value        = "1"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "rds.logical_replication"
    value        = "1"
    apply_method = "pending-reboot"
  }

  parameter {
    name  = "wal_keep_segments"
    value = "256"
  }

  parameter {
    name  = "max_standby_archive_delay"
    value = "600000"
  }

  parameter {
    name  = "max_standby_streaming_delay"
    value = "600000"
  }

  parameter {
    name  = "log_statement"
    value = "none"
  }

  parameter {
    name  = "log_min_duration_statement"
    value = "5000"
  }
  parameter {
    name  = "checkpoint_timeout"
    value = "600"
  }

  parameter {
    name  = "max_wal_size"
    value = "20000"
  }

  parameter {
    name  = "wal_sender_timeout"
    value = "0"
  }

  parameter {
    name  = "work_mem"
    value = "32768"
  }

  parameter {
    name  = "log_lock_waits"
    value = "1"
  }

  parameter {
    name  = "log_temp_files"
    value = "1"
  }

  # settings below are mostly relevant to Datadog Postgres Deep Database Monitoring
  parameter {
    name         = "pg_stat_statements.max"
    value        = var.pg_stat_statements_max
    apply_method = "pending-reboot"
  }

  parameter {
    name  = "pg_stat_statements.track"
    value = var.pg_stat_statements_track
  }

  parameter {
    name         = "track_activity_query_size"
    value        = var.track_activity_query_size
    apply_method = "pending-reboot"
  }

  # Cancel all queries which take longer than 900s
  parameter {
    name  = "statement_timeout"
    value = "900000"
  }
}

resource "aws_db_parameter_group" "postgres15" {
  count = var.db_family == "postgres15" ? 1 : 0

  name   = "${var.environment_name}-${var.db_name}-${var.db_family}"
  family = "postgres15"

  parameter {
    name         = "rds.force_ssl"
    value        = "1"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "rds.logical_replication"
    value        = "1"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "shared_preload_libraries"
    value        = "pg_stat_statements"
    apply_method = "pending-reboot"
  }

  parameter {
    name  = "max_standby_archive_delay"
    value = "600000"
  }

  parameter {
    name  = "max_standby_streaming_delay"
    value = "600000"
  }

  parameter {
    name  = "log_statement"
    value = "none"
  }

  parameter {
    name  = "log_min_duration_statement"
    value = "5000"
  }
  parameter {
    name  = "checkpoint_timeout"
    value = "600"
  }

  parameter {
    name  = "max_wal_size"
    value = "20000"
  }

  parameter {
    name  = "wal_sender_timeout"
    value = "0"
  }

  parameter {
    name  = "work_mem"
    value = "32768"
  }

  parameter {
    name  = "log_lock_waits"
    value = "1"
  }

  parameter {
    name  = "log_temp_files"
    value = "1"
  }

  # settings below are mostly relevant to Datadog Postgres Deep Database Monitoring
  parameter {
    name         = "pg_stat_statements.max"
    value        = var.pg_stat_statements_max
    apply_method = "pending-reboot"
  }

  parameter {
    name  = "pg_stat_statements.track"
    value = var.pg_stat_statements_track
  }

  parameter {
    name         = "track_activity_query_size"
    value        = var.track_activity_query_size
    apply_method = "pending-reboot"
  }

  # Cancel all queries which take longer than 900s
  parameter {
    name  = "statement_timeout"
    value = "900000"
  }
}

resource "aws_db_parameter_group" "postgres16" {
  count = var.db_family == "postgres16" ? 1 : 0

  name   = "${var.environment_name}-${var.db_name}-${var.db_family}"
  family = "postgres16"

  parameter {
    name         = "rds.force_ssl"
    value        = "1"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "rds.logical_replication"
    value        = "1"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "shared_preload_libraries"
    value        = "pg_stat_statements"
    apply_method = "pending-reboot"
  }

  parameter {
    name  = "max_standby_archive_delay"
    value = "600000"
  }

  parameter {
    name  = "max_standby_streaming_delay"
    value = "600000"
  }

  parameter {
    name  = "log_statement"
    value = "none"
  }

  parameter {
    name  = "log_min_duration_statement"
    value = "5000"
  }
  parameter {
    name  = "checkpoint_timeout"
    value = "600"
  }

  parameter {
    name  = "max_wal_size"
    value = "20000"
  }

  parameter {
    name  = "wal_sender_timeout"
    value = "0"
  }

  parameter {
    name  = "work_mem"
    value = "32768"
  }

  parameter {
    name  = "log_lock_waits"
    value = "1"
  }

  parameter {
    name  = "log_temp_files"
    value = "1"
  }

  # settings below are mostly relevant to Datadog Postgres Deep Database Monitoring
  parameter {
    name         = "pg_stat_statements.max"
    value        = var.pg_stat_statements_max
    apply_method = "pending-reboot"
  }

  parameter {
    name  = "pg_stat_statements.track"
    value = var.pg_stat_statements_track
  }

  parameter {
    name         = "track_activity_query_size"
    value        = var.track_activity_query_size
    apply_method = "pending-reboot"
  }

  # Cancel all queries which take longer than 900s
  parameter {
    name  = "statement_timeout"
    value = "900000"
  }
}
