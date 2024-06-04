# SPDX-FileCopyrightText: Copyright (c) 2024 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
# SPDX-License-Identifier: LicenseRef-NvidiaProprietary
#
# NVIDIA CORPORATION, its affiliates and licensors retain all intellectual
# property and proprietary rights in and to this material, related
# documentation and any modifications thereto. Any use, reproduction,
# disclosure or distribution of this material and related documentation
# without an express license agreement from NVIDIA CORPORATION or
# its affiliates is strictly prohibited.

output "vpc" {
  value = {
    network            = module.networking.network_name
    bastion_subnetwork = module.networking.subnetworks[local.public_subnet_name].name
    coturn_subnetwork  = module.networking.subnetworks[local.public_subnet_name].name
    api_subnetwork     = module.networking.subnetworks[local.private_subnet_name].name
    rp_subnetwork      = module.networking.subnetworks[local.public_subnet_name].name
  }
}
output "location" {
  value = local.location
}
output "region" {
  value = local.region
}
output "ui_bucket_location" {
  value = local.ui_bucket_location
}
output "zone" {
  value = local.zone
}
output "config_bucket" {
  value = {
    name = google_storage_bucket.config_bucket.name
  }
}
output "instance_tags" {
  value = {
    coturn = [local.coturn_instance_tag]
    api    = [local.api_instance_tag]
    rp     = [local.rp_instance_tag]
  }
}
output "bastion" {
  value = {
    private_ip = module.bastion_instance.private_ip
    public_ip  = module.bastion_instance.public_ip
  }
}
output "ssh_public_key" {
  value = var.ssh_public_key
}
output "user_access_cidrs" {
  value = var.user_access_cidrs
}