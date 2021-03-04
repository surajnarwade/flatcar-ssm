resource "aws_iam_instance_profile" "cilium_etcd" {
  name = "test-cilium_etcd"
  role = "test-flatcar-ssm"
}