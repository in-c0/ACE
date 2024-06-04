# SPDX-FileCopyrightText: Copyright (c) 2024 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
# SPDX-License-Identifier: LicenseRef-NvidiaProprietary
#
# NVIDIA CORPORATION, its affiliates and licensors retain all intellectual
# property and proprietary rights in and to this material, related
# documentation and any modifications thereto. Any use, reproduction,
# disclosure or distribution of this material and related documentation
# without an express license agreement from NVIDIA CORPORATION or
# its affiliates is strictly prohibited.

resource "azurerm_user_assigned_identity" "certificate_reader" {
  name                = format("%s-cert-reader", var.name)
  resource_group_name = var.base_config.resource_group.name
  location            = var.base_config.networking.region
}

module "certificate_key_vault" {
  source                    = "../../azure/key-vault"
  name                      = length(var.name) > 24 ? replace(var.name, "/\\W/", "") : var.name # use non-hyphenated if length exceeds 24
  resource_group_name       = var.base_config.resource_group.name
  region                    = var.base_config.networking.region
  access_policies           = local.certificate_vault_access_policies
  enable_rbac_authorization = false
}

module "api_certificate" {
  source       = "../../azure/key-vault-certificate"
  name         = var.name
  key_vault_id = module.certificate_key_vault.id
  contents     = local.wildcard_certificate_b64_content
  password     = ""
  depends_on   = [module.certificate_key_vault.access_policy]
}