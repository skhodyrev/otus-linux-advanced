terraform {
  required_version = ">= 1.2.0"

  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">= 0.96.1"
    }
  }
}

provider "yandex" {
  cloud_id  = local.cloud_id
  folder_id = local.folder_id
  zone      = "ru-central1-a"
}

provider "null" {
  # No configuration options
}

locals {
  # Don't forget to replace it with your 
  cloud_id  = "b1g2s68dk7b9efj8jj7v"
  folder_id = "b1g6bjr765psod9bcdu4"
}

