# Output variables

output "cloudfront_endpoint" {
    sensitive = false
    value = module.aws_cloudfront.distribution.domain_name
}

output "cloudfront_token" {
    sensitive = false
    value = module.aws_cloudfront.http_header_token
}

output "rds_aurora_cluster_endpoint" {
    sensitive = false
    value = module.aws_rds_aurora.cluster.endpoint
}

output "rds_aurora_cluster_master_password" {
    sensitive = true
    value = module.aws_rds_aurora
}

output "eks_cluster_endpoint" {
    sensitive = false
    value = module.aws_eks.cluster.endpoint
}

output "rds_master_credentials" {
    sensitive = true
    value     = module.aws_secrets_manager.rds_master_credentials
}

output "ingress_lb" {
    value = module.helm_charts.ingress.dns_name
}

output "iam_user_credentials" {
    value = module.aws_iam.iam_user_credentials
    sensitive = true
}