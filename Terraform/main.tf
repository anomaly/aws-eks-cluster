# Terraform Central Control

#  Amazon Virtual Private Cloud (Amazon VPC)
module "aws_vpc" {
    source = "./modules/vpc"
    tags = var.tags
}

# Amazon Identity and Access Management (IAM)
module "aws_iam" {
    source = "./modules/iam"
    rds_aurora_instances = module.aws_rds_aurora.instances
    tags = var.tags
}

# Amazon RDS Aurora Serverless (MySQL/PostgreSQL)
module "aws_rds_aurora" {
    source = "./modules/rds-aurora"
    vpc = module.aws_vpc.vpc
    subnets = module.aws_vpc.subnets.public
    tags = var.tags
}

# AWS Secrets Manager
module "aws_secrets_manager" {
    source = "./modules/secrets-manager"
    rds_aurora_cluster = module.aws_rds_aurora.cluster
    tags = var.tags
}

# Amazon Elastic Kubernetes Service (EKS)
module "aws_eks" {
    source = "./modules/eks"
    vpc = module.aws_vpc.vpc
    subnets = module.aws_vpc.subnets.private
    iam_roles = module.aws_iam.roles
    eks_role_policies = module.aws_iam.eks_role_policies
    eks_node_group_role_policies = module.aws_iam.eks_node_group_role_policies
    sns_topic_autoscaling_notification = module.aws_sns.auto_scaling_notifications
    cloudwatch_log_group = module.aws_cloudwatch.log_groups.eks_cluster
    tags = var.tags
}

# Amazon Simple Notification Service (SNS)
module "aws_sns" {
    source = "./modules/sns"
    tags = var.tags
}

# Amazon CloudWatch
module "aws_cloudwatch" {
    source = "./modules/cloudwatch"
    tags = var.tags
}
