locals {
  common_tags = {
    environment                    = var.environment_name
    "meta.zego.tools/cost-center"  = "b2b"
    "meta.zego.tools/managed-by"   = "terraform"
    "meta.zego.tools/owner"        = "b2b"
    "meta.zego.tools/managed-from" = var.zego_managed_from_tag
    "meta.zego.tools/service"      = var.zego_service_name_tag
  }
}