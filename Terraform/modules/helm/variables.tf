# Input variables

variable "eks_cluster" {
}

variable "namespace" {
    default = "kube-system"
}

variable "tags" {
    type = map
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
