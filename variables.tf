variable "glue_jobs" {
  description = <<EOT
Map of glue_jobs, attributes below
Required:
    - name
    - role_arn
    - command (block):
        - name (optional)
        - python_version (optional)
        - runtime (optional)
        - script_location (required)
Optional:
    - connections
    - default_arguments
    - description
    - execution_class
    - glue_version
    - job_mode
    - job_run_queuing_enabled
    - maintenance_window
    - max_capacity
    - max_retries
    - non_overridable_arguments
    - number_of_workers
    - region
    - security_configuration
    - tags
    - tags_all
    - timeout
    - worker_type
    - execution_property (block):
        - max_concurrent_runs (optional)
    - notification_property (block):
        - notify_delay_after (optional)
    - source_control_details (block):
        - auth_strategy (optional)
        - auth_token (optional)
        - branch (optional)
        - folder (optional)
        - last_commit_id (optional)
        - owner (optional)
        - provider (optional)
        - repository (optional)
EOT

  type = map(object({
    name                      = string
    role_arn                  = string
    tags_all                  = optional(map(string))
    tags                      = optional(map(string))
    security_configuration    = optional(string)
    region                    = optional(string)
    number_of_workers         = optional(number)
    non_overridable_arguments = optional(map(string))
    max_retries               = optional(number)
    max_capacity              = optional(number)
    maintenance_window        = optional(string)
    job_run_queuing_enabled   = optional(bool)
    job_mode                  = optional(string)
    glue_version              = optional(string)
    execution_class           = optional(string)
    description               = optional(string)
    default_arguments         = optional(map(string))
    connections               = optional(list(string))
    timeout                   = optional(number)
    worker_type               = optional(string)
    command = object({
      name            = optional(string)
      python_version  = optional(string)
      runtime         = optional(string)
      script_location = string
    })
    execution_property = optional(object({
      max_concurrent_runs = optional(number)
    }))
    notification_property = optional(object({
      notify_delay_after = optional(number)
    }))
    source_control_details = optional(object({
      auth_strategy  = optional(string)
      auth_token     = optional(string)
      branch         = optional(string)
      folder         = optional(string)
      last_commit_id = optional(string)
      owner          = optional(string)
      provider       = optional(string)
      repository     = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.glue_jobs : (
        v.command.python_version == null || (contains([for v in ["2", "3", "3.9"] : lower(v)], lower(v.command.python_version)))
      )
    ])
    error_message = "must be one of: 2, 3, 3.9"
  }
  validation {
    condition = alltrue([
      for k, v in var.glue_jobs : (
        v.command.runtime == null || (contains([for v in ["Ray2.4"] : lower(v)], lower(v.command.runtime)))
      )
    ])
    error_message = "must be one of: Ray2.4"
  }
  validation {
    condition = alltrue([
      for k, v in var.glue_jobs : (
        v.execution_property == null || (v.execution_property.max_concurrent_runs == null || (v.execution_property.max_concurrent_runs >= 1))
      )
    ])
    error_message = "must be at least 1"
  }
  validation {
    condition = alltrue([
      for k, v in var.glue_jobs : (
        v.max_retries == null || (v.max_retries >= 0 && v.max_retries <= 10)
      )
    ])
    error_message = "must be between 0 and 10"
  }
  validation {
    condition = alltrue([
      for k, v in var.glue_jobs : (
        v.notification_property == null || (v.notification_property.notify_delay_after == null || (v.notification_property.notify_delay_after >= 1))
      )
    ])
    error_message = "must be at least 1"
  }
  validation {
    condition = alltrue([
      for k, v in var.glue_jobs : (
        v.number_of_workers == null || (v.number_of_workers >= 1)
      )
    ])
    error_message = "must be at least 1"
  }
  # Note: 7 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

