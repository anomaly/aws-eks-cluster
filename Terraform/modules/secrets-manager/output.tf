# Output variables

output "secrets" {
    value = {
        rds_aurora_access_details = aws_secretsmanager_secret.rds_aurora_access_details
        mq_broker_access_details = aws_secretsmanager_secret.mq_broker_access_details
        s3_buckets = aws_secretsmanager_secret.s3_buckets
        redis_cluster_endpoint = aws_secretsmanager_secret.redis_cluster_endpoint
    }
}

output "rds_master_credentials" {
    sensitive = true
    value = data.aws_secretsmanager_secret_version.rds_master_credentials.secret_string
}
