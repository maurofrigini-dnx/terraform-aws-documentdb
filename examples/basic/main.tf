terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = ">= 5.0"

    random = ">= 3.0"
  }
}

provider "aws" {
  region = "eu-west-2"
}

data "aws_vpc" "default" {
  default = false
}

data "aws_subnets" "all" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

resource "random_password" "password" {
  length  = 16
  special = true
}

module "docdb" {
  source = "../.."

  name_prefix = "documentdb-cluster-example"

  instance_class = "db.t3.medium"
  replica_count  = "2"

  engine                  = "docdb"
  engine_version          = "5.0.0"
  engine_parameter_family = "docdb-5.0.0"

  master_username = "master"
  master_password = random_password.password

  vpc_id     = data.aws_vpc.default.id
  subnet_ids = data.aws_subnets.all.ids

  cidr_blocks = ["10.10.10.10/32"]

  skip_final_snapshot = true

  create_security_group = true

  parameters = [
    {
      apply_method = "immediate"
      name         = "tls"
      value        = "enabled"
    },
  ]
}
