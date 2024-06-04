# SPDX-FileCopyrightText: Copyright (c) 2024 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
# SPDX-License-Identifier: LicenseRef-NvidiaProprietary
#
# NVIDIA CORPORATION, its affiliates and licensors retain all intellectual
# property and proprietary rights in and to this material, related
# documentation and any modifications thereto. Any use, reproduction,
# disclosure or distribution of this material and related documentation
# without an express license agreement from NVIDIA CORPORATION or
# its affiliates is strictly prohibited.

module "coturn_instance" {
  source                = "../../aws/ec2"
  instance_type         = local.coturn_instance_details.instance_type
  instance_name         = local.name
  ami_lookup            = local.coturn_ami_lookup
  ec2_key               = var.base_config.keypair.name
  root_volume_type      = local.coturn_instance_details.root_volume_type
  root_volume_size      = local.coturn_instance_details.root_volume_size
  instance_profile_name = aws_iam_instance_profile.instance.name
  vpc_id                = var.base_config.networking.vpc_id
  subnet_id             = element(var.base_config.networking.public_subnet_ids, 0)
  additional_sg_ids     = var.base_config.coturn_sg_ids
  include_public_ip     = true
  user_data = templatefile("${path.module}/user-data/user-data.sh.tpl", {
    name           = local.name
    config_bucket  = var.base_config.config_bucket
    config_scripts = local.config_scripts
  })
}