# SPDX-FileCopyrightText: Copyright (c) 2024 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
# SPDX-License-Identifier: LicenseRef-NvidiaProprietary
#
# NVIDIA CORPORATION, its affiliates and licensors retain all intellectual
# property and proprietary rights in and to this material, related
# documentation and any modifications thereto. Any use, reproduction,
# disclosure or distribution of this material and related documentation
# without an express license agreement from NVIDIA CORPORATION or
# its affiliates is strictly prohibited.

module "instance" {
  source                  = "../../gcp/instance"
  name                    = local.instance_config.name
  region                  = local.instance_config.region
  zone                    = local.instance_config.zone
  network                 = local.instance_config.network
  subnetwork              = local.instance_config.subnetwork
  static_public_ip        = local.instance_config.static_public_ip
  network_interface       = local.instance_config.network_interface
  tags                    = local.instance_config.tags
  machine_type            = local.instance_config.machine_type
  service_account_email   = google_service_account.service_account.email
  service_account_scopes  = local.instance_config.service_account_scopes
  boot_disk               = local.instance_config.boot_disk
  ssh_public_key          = local.instance_config.ssh_public_key
  ssh_user                = local.instance_config.ssh_user
  metadata_startup_script = local.instance_config.metadata_startup_script
}