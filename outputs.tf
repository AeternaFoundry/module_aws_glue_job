output "glue_jobs_id" {
  description = "Map of id values across all glue_jobs, keyed the same as var.glue_jobs"
  value       = { for k, v in aws_glue_job.glue_jobs : k => v.id if v.id != null && length(v.id) > 0 }
}
output "glue_jobs_arn" {
  description = "Map of arn values across all glue_jobs, keyed the same as var.glue_jobs"
  value       = { for k, v in aws_glue_job.glue_jobs : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "glue_jobs_command" {
  description = "Map of command values across all glue_jobs, keyed the same as var.glue_jobs"
  value       = { for k, v in aws_glue_job.glue_jobs : k => one(v.command) if v.command != null && length(v.command) > 0 }
}
output "glue_jobs_connections" {
  description = "Map of connections values across all glue_jobs, keyed the same as var.glue_jobs"
  value       = { for k, v in aws_glue_job.glue_jobs : k => v.connections if v.connections != null && length(v.connections) > 0 }
}
output "glue_jobs_default_arguments" {
  description = "Map of default_arguments values across all glue_jobs, keyed the same as var.glue_jobs"
  value       = { for k, v in aws_glue_job.glue_jobs : k => v.default_arguments if v.default_arguments != null && length(v.default_arguments) > 0 }
}
output "glue_jobs_description" {
  description = "Map of description values across all glue_jobs, keyed the same as var.glue_jobs"
  value       = { for k, v in aws_glue_job.glue_jobs : k => v.description if v.description != null && length(v.description) > 0 }
}
output "glue_jobs_execution_class" {
  description = "Map of execution_class values across all glue_jobs, keyed the same as var.glue_jobs"
  value       = { for k, v in aws_glue_job.glue_jobs : k => v.execution_class if v.execution_class != null && length(v.execution_class) > 0 }
}
output "glue_jobs_execution_property" {
  description = "Map of execution_property values across all glue_jobs, keyed the same as var.glue_jobs"
  value       = { for k, v in aws_glue_job.glue_jobs : k => one(v.execution_property) if v.execution_property != null && length(v.execution_property) > 0 }
}
output "glue_jobs_glue_version" {
  description = "Map of glue_version values across all glue_jobs, keyed the same as var.glue_jobs"
  value       = { for k, v in aws_glue_job.glue_jobs : k => v.glue_version if v.glue_version != null && length(v.glue_version) > 0 }
}
output "glue_jobs_job_mode" {
  description = "Map of job_mode values across all glue_jobs, keyed the same as var.glue_jobs"
  value       = { for k, v in aws_glue_job.glue_jobs : k => v.job_mode if v.job_mode != null && length(v.job_mode) > 0 }
}
output "glue_jobs_job_run_queuing_enabled" {
  description = "Map of job_run_queuing_enabled values across all glue_jobs, keyed the same as var.glue_jobs"
  value       = { for k, v in aws_glue_job.glue_jobs : k => v.job_run_queuing_enabled if v.job_run_queuing_enabled != null }
}
output "glue_jobs_maintenance_window" {
  description = "Map of maintenance_window values across all glue_jobs, keyed the same as var.glue_jobs"
  value       = { for k, v in aws_glue_job.glue_jobs : k => v.maintenance_window if v.maintenance_window != null && length(v.maintenance_window) > 0 }
}
output "glue_jobs_max_capacity" {
  description = "Map of max_capacity values across all glue_jobs, keyed the same as var.glue_jobs"
  value       = { for k, v in aws_glue_job.glue_jobs : k => v.max_capacity if v.max_capacity != null }
}
output "glue_jobs_max_retries" {
  description = "Map of max_retries values across all glue_jobs, keyed the same as var.glue_jobs"
  value       = { for k, v in aws_glue_job.glue_jobs : k => v.max_retries if v.max_retries != null }
}
output "glue_jobs_name" {
  description = "Map of name values across all glue_jobs, keyed the same as var.glue_jobs"
  value       = { for k, v in aws_glue_job.glue_jobs : k => v.name if v.name != null && length(v.name) > 0 }
}
output "glue_jobs_non_overridable_arguments" {
  description = "Map of non_overridable_arguments values across all glue_jobs, keyed the same as var.glue_jobs"
  value       = { for k, v in aws_glue_job.glue_jobs : k => v.non_overridable_arguments if v.non_overridable_arguments != null && length(v.non_overridable_arguments) > 0 }
}
output "glue_jobs_notification_property" {
  description = "Map of notification_property values across all glue_jobs, keyed the same as var.glue_jobs"
  value       = { for k, v in aws_glue_job.glue_jobs : k => one(v.notification_property) if v.notification_property != null && length(v.notification_property) > 0 }
}
output "glue_jobs_number_of_workers" {
  description = "Map of number_of_workers values across all glue_jobs, keyed the same as var.glue_jobs"
  value       = { for k, v in aws_glue_job.glue_jobs : k => v.number_of_workers if v.number_of_workers != null }
}
output "glue_jobs_region" {
  description = "Map of region values across all glue_jobs, keyed the same as var.glue_jobs"
  value       = { for k, v in aws_glue_job.glue_jobs : k => v.region if v.region != null && length(v.region) > 0 }
}
output "glue_jobs_role_arn" {
  description = "Map of role_arn values across all glue_jobs, keyed the same as var.glue_jobs"
  value       = { for k, v in aws_glue_job.glue_jobs : k => v.role_arn if v.role_arn != null && length(v.role_arn) > 0 }
}
output "glue_jobs_security_configuration" {
  description = "Map of security_configuration values across all glue_jobs, keyed the same as var.glue_jobs"
  value       = { for k, v in aws_glue_job.glue_jobs : k => v.security_configuration if v.security_configuration != null && length(v.security_configuration) > 0 }
}
output "glue_jobs_source_control_details" {
  description = "Map of source_control_details values across all glue_jobs, keyed the same as var.glue_jobs"
  value       = { for k, v in aws_glue_job.glue_jobs : k => one(v.source_control_details) if v.source_control_details != null && length(v.source_control_details) > 0 }
  sensitive   = true
}
output "glue_jobs_tags" {
  description = "Map of tags values across all glue_jobs, keyed the same as var.glue_jobs"
  value       = { for k, v in aws_glue_job.glue_jobs : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "glue_jobs_tags_all" {
  description = "Map of tags_all values across all glue_jobs, keyed the same as var.glue_jobs"
  value       = { for k, v in aws_glue_job.glue_jobs : k => v.tags_all if v.tags_all != null && length(v.tags_all) > 0 }
}
output "glue_jobs_timeout" {
  description = "Map of timeout values across all glue_jobs, keyed the same as var.glue_jobs"
  value       = { for k, v in aws_glue_job.glue_jobs : k => v.timeout if v.timeout != null }
}
output "glue_jobs_worker_type" {
  description = "Map of worker_type values across all glue_jobs, keyed the same as var.glue_jobs"
  value       = { for k, v in aws_glue_job.glue_jobs : k => v.worker_type if v.worker_type != null && length(v.worker_type) > 0 }
}

