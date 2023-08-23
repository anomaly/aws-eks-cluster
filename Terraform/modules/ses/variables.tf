# Input variables

variable "domain" {
    type = string
    default = "elsaschools.edu.au"
}

variable "sns_topics" {
    type = map
}

variable "tags" {
    type = map
}