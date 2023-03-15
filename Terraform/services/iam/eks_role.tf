# @TODO
#
# Description:
# @TODO
#
# AWS Documentation:
# @TODO
#
# Terrafom Documentation:
# @TODO

resource "aws_iam_role" "eks" {
    name = "${var.tags.Name}RoleForAmazonEKS"
    assume_role_policy = file("${path.module}/eks_assume_role.json")
    tags = {
        Name = "${var.tags.Name}RoleForAmazonEKS"
        billing-id = var.tags.billing-id
    }
}

# ...
resource "aws_iam_role_policy_attachment" "amazon_eks_cluster_policy" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
    role = aws_iam_role.eks.name
}

# Optionally, enable Security Groups for Pods
# Reference: https://docs.aws.amazon.com/eks/latest/userguide/security-groups-for-pods.html
resource "aws_iam_role_policy_attachment" "amazon_eks_vpc_resource_controller" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
    role = aws_iam_role.eks.name
}
