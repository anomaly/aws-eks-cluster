# Global variables

variable "profile" {
    description = "AWS CLI profile"
    type = string
    default = "default"
}

variable "region" {
    description = "Region, e.g. us-east-1 or ap-southeast-2"
    type = string
    default = "ap-southeast-2"
}

variable "tags" {
    type = map
    default = {
        "Name"  = "KubernetesCluster"
        "billing-id" = "k8cluster"
    }
}

variable "gh_username" {
    type = string
    sensitive = true
}

variable "gh_password" {
    type = string
    sensitive = true
}

variable "gh_email" {
    type = string
}

variable "oci_registry" {
    type = string
    default = "ghcr.io"
}

variable "ssl_arn" {
    type = string
}

variable "fqdn" {
    type = string
}