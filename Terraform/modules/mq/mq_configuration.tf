# AWS Secrets Manager
#
# Description:
# ...
#
# AWS Documentation:
# ...
#
# Terrafom Documentation:
# ...

resource "aws_mq_configuration" "default" {
    name = "${replace(lower(var.tags.Name), "/[^a-z0-9]/", "")}-mq-broker-configuration"
    description = "[${var.tags.Name}] configuration for the ActiveMQ broker"

    engine_type = "RabbitMQ"
    engine_version = "3.11.16"

    # https://docs.aws.amazon.com/amazon-mq/latest/developer-guide/amazon-mq-broker-configuration-parameters.html
    # data = file("${path.module}/configuration/default.xml")

    data = file("${path.module}/configuration/default.ini")

}
