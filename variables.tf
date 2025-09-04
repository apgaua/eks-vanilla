variable "region" {
  type = string
}

variable "project_name" {
  type = string
}

variable "kubernetes_version" {
  type    = string
  default = "1.27"
}

# variable "zonal_shift" {
#   type    = bool
#   default = false
# }

# variable "upgrade_policy_support_type" {
#   type    = string
#   default = "STANDARD"
# }

variable "auto_scale_options" {
  type = object({
    min     = number
    max     = number
    desired = number
  })
}

variable "node_instance_type" {
  type = list(string)
}

variable "default_tags" {
  type        = map(string)
  description = "Default tags to be set in resources"
}

variable "ssm_vpc_id" {
  type = string
}

variable "ssm_public_subnets" {
  type = list(string)
}

variable "ssm_private_subnets" {
  type = list(string)
}

variable "ssm_pod_subnets" {
  type = list(string)
}
