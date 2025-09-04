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
