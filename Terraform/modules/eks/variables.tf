# Input variables

variable "vpc" {
}

variable "subnets" {
}

variable "eks_role" {
}

variable "eks_role_policies" {
}

variable "eks_node_group_role" {
}

variable "eks_node_group_role_policies" {
}

variable "sns_topic_autoscaling_notification" {
}

variable "tags" {
    type = map
}
