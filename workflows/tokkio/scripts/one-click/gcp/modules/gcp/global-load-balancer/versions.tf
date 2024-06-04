# SPDX-FileCopyrightText: Copyright (c) 2024 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
# SPDX-License-Identifier: LicenseRef-NvidiaProprietary
#
# NVIDIA CORPORATION, its affiliates and licensors retain all intellectual
# property and proprietary rights in and to this material, related
# documentation and any modifications thereto. Any use, reproduction,
# disclosure or distribution of this material and related documentation
# without an express license agreement from NVIDIA CORPORATION or
# its affiliates is strictly prohibited.

terraform {
  experiments = [module_variable_optional_attrs]
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}
# terraform {
#   required_providers {
#     google = {
#       source  = "hashicorp/google"
#       version = "= 4.44.1"
#     }
#   }
#   required_version = "= 1.2.4"
# }
