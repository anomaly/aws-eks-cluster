
data "aws_secretsmanager_secret" "rds_master_credentials" {
    arn = var.rds_aurora_cluster.master_user_secret.0.secret_arn
}

data "aws_secretsmanager_secret_version" "rds_master_credentials" {
    secret_id = data.aws_secretsmanager_secret.rds_master_credentials.id
}
