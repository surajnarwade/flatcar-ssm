data "ct_config" "ignition" {
  content = templatefile("${path.module}/ignition.yaml", {
    "CLUSTER_NAME"          = "yolo"
  })
}


terraform {
  required_version = ">= 0.12"

  required_providers {
    aws   = ">= 2.28.1"
    ct = {
      source  = "poseidon/ct"
      version = "0.8.0"
    }
  }
}



provider "ct" {}
