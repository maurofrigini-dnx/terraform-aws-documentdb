# terraform-aws-documentdb
Terraform module for provisioning DocumentDB clusters on AWS

## Usage

```hcl
module "docdb" {
  source  = "dare-global/documentdb/aws"
  version = "1.X.X"

  name_prefix = "docdbdb-cluster-example"

  instance_class = "db.t3.medium"
  instance_count  = "1"

  engine                  = "docdb"
  engine_version          = "5.0.0"

  master_username = "master"
  master_password = "password"

  vpc_id     = data.aws_vpc.default.id
  subnet_ids = data.aws_subnets.all.ids
}
```

## Examples

* [Basic](https://github.com/dare-global/terraform-aws-documentdb/tree/main/examples/basic)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_docdb_cluster.docdb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/docdb_cluster) | resource |
| [aws_docdb_cluster_instance.docdb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/docdb_cluster_instance) | resource |
| [aws_docdb_cluster_parameter_group.docdb_parameter_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/docdb_cluster_parameter_group) | resource |
| [aws_docdb_subnet_group.docdb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/docdb_subnet_group) | resource |
| [aws_security_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_vpc_security_group_egress_rule.default_egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_egress_rule) | resource |
| [aws_vpc_security_group_ingress_rule.cidr_blocks](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_ingress_rule) | resource |
| [aws_vpc_security_group_ingress_rule.prefix_lists](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_ingress_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apply_immediately"></a> [apply\_immediately](#input\_apply\_immediately) | Specifies whether any cluster modifications are applied immediately, or during the next maintenance window. | `bool` | `false` | no |
| <a name="input_backup_retention_period"></a> [backup\_retention\_period](#input\_backup\_retention\_period) | Common name prefix used to name resources | `number` | `1` | no |
| <a name="input_ca_cert_identifier"></a> [ca\_cert\_identifier](#input\_ca\_cert\_identifier) | Identifier of the certificate authority (CA) certificate for the DB instance. | `string` | `"rds-ca-rsa2048-g1"` | no |
| <a name="input_cidr_blocks"></a> [cidr\_blocks](#input\_cidr\_blocks) | ipv4 cidr ranges to associate with the security group | `list(string)` | `[]` | no |
| <a name="input_cluster_instance_name_prefix"></a> [cluster\_instance\_name\_prefix](#input\_cluster\_instance\_name\_prefix) | Common name prefix used to name resources | `string` | `null` | no |
| <a name="input_create_security_group"></a> [create\_security\_group](#input\_create\_security\_group) | Whether to create a security group for the cluster | `bool` | `true` | no |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | Enable deletion protection for the cluster | `bool` | `null` | no |
| <a name="input_enable_performance_insights"></a> [enable\_performance\_insights](#input\_enable\_performance\_insights) | Enable performance insights for the cluster instances | `bool` | `true` | no |
| <a name="input_enabled_cloudwatch_logs_exports"></a> [enabled\_cloudwatch\_logs\_exports](#input\_enabled\_cloudwatch\_logs\_exports) | Enable log exports for audit or profiler logs | `list(string)` | `[]` | no |
| <a name="input_engine"></a> [engine](#input\_engine) | Common name prefix used to name resources | `string` | n/a | yes |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | The database engine version. Updating this argument results in an outage. | `string` | n/a | yes |
| <a name="input_instance_class"></a> [instance\_class](#input\_instance\_class) | The instance class to use | `string` | `"db.t4g.medium"` | no |
| <a name="input_instance_count"></a> [instance\_count](#input\_instance\_count) | The number of instances to be created and joined to the cluster | `number` | `1` | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | The ARN for the KMS encryption key. When specifying kms\_key\_id, storage\_encrypted needs to be set to true. | `string` | `null` | no |
| <a name="input_master_password"></a> [master\_password](#input\_master\_password) | The password for the master db password. This should be created using a random string | `string` | n/a | yes |
| <a name="input_master_username"></a> [master\_username](#input\_master\_username) | The password for the master db user. This should be created using a random string | `string` | n/a | yes |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | Common name prefix used to name resources | `string` | n/a | yes |
| <a name="input_parameters"></a> [parameters](#input\_parameters) | A list of DB cluster parameters to apply. Note that parameters may differ from one family to an other | `list(object({ apply_method = optional(string), value = string, name = string }))` | `[]` | no |
| <a name="input_performance_insights_kms_key"></a> [performance\_insights\_kms\_key](#input\_performance\_insights\_kms\_key) | KMS key ID to use for performance insights | `string` | `null` | no |
| <a name="input_port"></a> [port](#input\_port) | The port on which the DB accepts connections | `string` | `"27017"` | no |
| <a name="input_preferred_backup_window"></a> [preferred\_backup\_window](#input\_preferred\_backup\_window) | Common name prefix used to name resources | `string` | `null` | no |
| <a name="input_prefix_list_ids"></a> [prefix\_list\_ids](#input\_prefix\_list\_ids) | list of prefix lists to associate with the security group | `list(string)` | `[]` | no |
| <a name="input_promotion_tier"></a> [promotion\_tier](#input\_promotion\_tier) | Failover Priority setting on instance level. The reader who has lower tier has higher priority to get promoter to writer | `string` | `null` | no |
| <a name="input_revoke_rules_on_delete"></a> [revoke\_rules\_on\_delete](#input\_revoke\_rules\_on\_delete) | Instruct Terraform to revoke all of the Security Groups attached<br>  ingress and egress rules before deleting the rule itself.<br>  Defaults to true | `bool` | `true` | no |
| <a name="input_security_group_tags"></a> [security\_group\_tags](#input\_security\_group\_tags) | Additional tags for the security group | `map(string)` | `{}` | no |
| <a name="input_skip_final_snapshot"></a> [skip\_final\_snapshot](#input\_skip\_final\_snapshot) | Common name prefix used to name resources | `string` | `null` | no |
| <a name="input_storage_encrypted"></a> [storage\_encrypted](#input\_storage\_encrypted) | Specifies whether the DB cluster is encrypted. The default is false | `bool` | `null` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | A list of VPC subnet IDs. | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to all resources | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The VPC ID where the cluster will be deployed | `string` | n/a | yes |
| <a name="input_vpc_security_group_ids"></a> [vpc\_security\_group\_ids](#input\_vpc\_security\_group\_ids) | List of VPC security groups to associate with the Cluster | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_arn"></a> [cluster\_arn](#output\_cluster\_arn) | n/a |
| <a name="output_cluster_endpoint"></a> [cluster\_endpoint](#output\_cluster\_endpoint) | n/a |
| <a name="output_cluster_hosted_zone"></a> [cluster\_hosted\_zone](#output\_cluster\_hosted\_zone) | n/a |
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | n/a |
| <a name="output_cluster_members"></a> [cluster\_members](#output\_cluster\_members) | n/a |
| <a name="output_reader_endpoint"></a> [reader\_endpoint](#output\_reader\_endpoint) | n/a |
| <a name="output_security_group_arn"></a> [security\_group\_arn](#output\_security\_group\_arn) | ARN of the DocumentDB cluster Security Group |
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | ID of the DocumentDB cluster Security Group |
| <a name="output_security_group_name"></a> [security\_group\_name](#output\_security\_group\_name) | Name of the DocumentDB cluster Security Group |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## License

See LICENSE file for full details.

## Maintainers

* [Marcin Cuber](https://github.com/marcincuber)

## Pre-commit hooks

### Install dependencies

* [`pre-commit`](https://pre-commit.com/#install)
* [`terraform-docs`](https://github.com/segmentio/terraform-docs) required for `terraform_docs` hooks.
* [`TFLint`](https://github.com/terraform-linters/tflint) required for `terraform_tflint` hook.

#### MacOS

```bash
brew install pre-commit terraform-docs tflint
```