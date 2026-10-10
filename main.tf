resource "aws_glue_job" "glue_jobs" {
  for_each = var.glue_jobs

  name                      = each.value.name
  role_arn                  = each.value.role_arn
  tags_all                  = each.value.tags_all
  tags                      = each.value.tags
  security_configuration    = each.value.security_configuration
  region                    = each.value.region
  number_of_workers         = each.value.number_of_workers
  non_overridable_arguments = each.value.non_overridable_arguments
  max_retries               = each.value.max_retries
  max_capacity              = each.value.max_capacity
  maintenance_window        = each.value.maintenance_window
  job_run_queuing_enabled   = each.value.job_run_queuing_enabled
  job_mode                  = each.value.job_mode
  glue_version              = each.value.glue_version
  execution_class           = each.value.execution_class
  description               = each.value.description
  default_arguments         = each.value.default_arguments
  connections               = each.value.connections
  timeout                   = each.value.timeout
  worker_type               = each.value.worker_type

  command {
    name            = each.value.command.name
    python_version  = each.value.command.python_version
    runtime         = each.value.command.runtime
    script_location = each.value.command.script_location
  }

  dynamic "execution_property" {
    for_each = each.value.execution_property != null ? [each.value.execution_property] : []
    content {
      max_concurrent_runs = execution_property.value.max_concurrent_runs
    }
  }

  dynamic "notification_property" {
    for_each = each.value.notification_property != null ? [each.value.notification_property] : []
    content {
      notify_delay_after = notification_property.value.notify_delay_after
    }
  }

  dynamic "source_control_details" {
    for_each = each.value.source_control_details != null ? [each.value.source_control_details] : []
    content {
      auth_strategy  = source_control_details.value.auth_strategy
      auth_token     = source_control_details.value.auth_token
      branch         = source_control_details.value.branch
      folder         = source_control_details.value.folder
      last_commit_id = source_control_details.value.last_commit_id
      owner          = source_control_details.value.owner
      provider       = source_control_details.value.provider
      repository     = source_control_details.value.repository
    }
  }
}

