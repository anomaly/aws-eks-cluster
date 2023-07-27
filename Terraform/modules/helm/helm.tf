# ...

# AWS load balancer controller
# Elastic Load Balancing
# https://aws.amazon.com/elasticloadbalancing/
resource "helm_release" "aws-load-balancer-controller" {
  name       = "aws-load-balancer-controller"
  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"
  namespace  = var.namespace

  set {
    name  = "clusterName"
    value = var.eks_cluster.name
  }

  set {
    name  = "serviceAccount.create"
    value = "true"
  }

  set {
    name  = "serviceAccount.name"
    value = "aws-load-balancer-controller"
  }

  depends_on = [
    var.eks_cluster
  ]
}


resource "kubernetes_config_map" "app_config" {

  metadata {
    name = "harvestos-config-map"
    namespace = "harvest"
  }

  data = {
    ENV_VAR_1 = "value1"
    ENV_VAR_2 = "value2"
  }

  depends_on = [
    var.eks_cluster
  ]


}

# resource "helm_release" "lab-python-mock-server" {

#     name = "lab-python-mock-server"
#     repository = "oci://ghcr.io/anomaly/charts"
#     chart = "lab-python-mock-server"
#     namespace = "app-backend"

#     version = "0.4.0"

#     create_namespace = true

#     set {
#         name = "ingress.annotations.alb\\.ingress\\.kubernetes\\.io/group\\.name"
#         value = "python-app-ingress"
#         type = "string"
#     }

#     depends_on = [
#         helm_release.aws-load-balancer-controller,
#     ]

# }


# resource "helm_release" "remix-aws-template" {

#     name = "remix-aws-template"
#     repository = "oci://ghcr.io/anomaly/charts"
#     chart = "remix-aws-template"
#     namespace = "app-frontend"
#     create_namespace = true

#     set {
#         name = "ingress.annotations.alb\\.ingress\\.kubernetes\\.io/group\\.name"
#         value = "python-app-ingress"
#         type = "string"
#     }

#     depends_on = [
#         helm_release.aws-load-balancer-controller,
#     ]

# }

# resource "helm_release" "server" {

#     name = "server"
#     repository = "oci://ghcr.io/harvestos/charts"
#     chart = "server"
#     namespace = "harvest"

#     version = "0.1.0"

#     create_namespace = true

#     set {
#         name = "ingress.annotations.alb\\.ingress\\.kubernetes\\.io/group\\.name"
#         value = "harvest"
#         type = "string"
#     }

#     depends_on = [
#         helm_release.aws-load-balancer-controller,
#     ]

# }



# resource "helm_release" "web-client" {

#     name = "web-client"
#     repository = "oci://ghcr.io/harvestos/charts"
#     version = "0.1.5"
#     chart = "web-client"
#     namespace = "harvest"
#     create_namespace = true

#     set {
#         name = "ingress.annotations.alb\\.ingress\\.kubernetes\\.io/group\\.name"
#         value = "harvest"
#         type = "string"
#     }

#     depends_on = [
#         helm_release.aws-load-balancer-controller,
#     ]

# }
