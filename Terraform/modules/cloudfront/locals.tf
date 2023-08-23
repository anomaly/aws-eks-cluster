# ...

locals {
    origin_id_load_balancer = "${lower(var.tags.Name)}-loadbalancer"
    origin_id_s3_media = "${lower(var.tags.Name)}-s3-bucket-media"
}
