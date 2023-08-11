# Use the AWS provider to get information about load balancers provisioned
# this is not available as a result of the helm chart as all the chart
# does is execute a kubectl apply command
#
data "aws_lb" "load_balancer" {

  depends_on = [
    helm_release.aws-load-balancer-controller
  ]
}


# Make available the ingress information available
# This will have  more than just the DNS name
output "ingress" {
  value = data.aws_lb.load_balancer
}