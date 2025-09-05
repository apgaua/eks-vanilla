# EKS Course repository

## Commands

| Terraform | Description |
|--------------------|-------------|
| terraform fmt --recursive | Format terraform files |
| terraform init -backend-config=environment/dev/backend.tfvars | Init terraform backend config|
| terraform validate | Validate terraform workflow |
| terraform apply -auto-approve -var-file=environment/dev/terraform.tfvars | Create structure |
| terraform destroy -auto-approve -var-file=environment/dev/terraform.tfvars | Destroy structure |

## Structure
![Estrutura terraform](diagrama.png)

## Repository dependency
| Project | Priority | URL | Description |
|---------|----------|-----|-------------|
| EKS Networking | 1 | https://github.com/apgaua/eks-networking | VPC structure to deploy EKS |
| This one | 2 | https://github.com/apgaua/eks-vanilla | EKS Basic deployment |

<!-- NAO PREENCHA ABAIXO DESTA LINHA-->
<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_eks_cluster"></a> [eks\_cluster](#module\_eks\_cluster) | github.com/apgaua/terraform-modules//eks-cluster | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster"></a> [cluster](#input\_cluster) | n/a | <pre>list(object({<br/>    kubernetes_version = string<br/>    zonal_shift        = bool<br/>    access_config = optional(object({<br/>      authentication_mode                         = string<br/>      bootstrap_cluster_creator_admin_permissions = bool<br/>    }))<br/>    upgrade_policy_support_type = string<br/>    enabled_cluster_log_types   = list(string)<br/>    auto_scale_options = list(object({<br/>      min     = number<br/>      max     = number<br/>      desired = number<br/>    }))<br/>    node_instance_type      = list(string)<br/>    addons = optional(list(object({<br/>      name  = string<br/>      version = string<br/>    })), [])<br/>  }))</pre> | n/a | yes |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | Default tags to be set in resources | `map(string)` | n/a | yes |
| <a name="input_helm_charts"></a> [helm\_charts](#input\_helm\_charts) | n/a | <pre>list(object({<br/>    name             = string<br/>    repository       = string<br/>    chart            = string<br/>    namespace        = string<br/>    create_namespace = optional(bool, false)<br/>    wait             = optional(bool, false)<br/>    version          = optional(string, null)<br/>    set = optional(list(object({<br/>      name  = string<br/>      value = string<br/>    })), [])<br/>  }))</pre> | `[]` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | n/a | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | n/a | yes |
| <a name="input_ssm_pod_subnets"></a> [ssm\_pod\_subnets](#input\_ssm\_pod\_subnets) | n/a | `list(string)` | n/a | yes |
| <a name="input_ssm_private_subnets"></a> [ssm\_private\_subnets](#input\_ssm\_private\_subnets) | n/a | `list(string)` | n/a | yes |
| <a name="input_ssm_public_subnets"></a> [ssm\_public\_subnets](#input\_ssm\_public\_subnets) | n/a | `list(string)` | n/a | yes |
| <a name="input_ssm_vpc_id"></a> [ssm\_vpc\_id](#input\_ssm\_vpc\_id) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->