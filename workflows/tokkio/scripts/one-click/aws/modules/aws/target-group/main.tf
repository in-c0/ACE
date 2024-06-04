# SPDX-FileCopyrightText: Copyright (c) 2024 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
# SPDX-License-Identifier: LicenseRef-NvidiaProprietary
#
# NVIDIA CORPORATION, its affiliates and licensors retain all intellectual
# property and proprietary rights in and to this material, related
# documentation and any modifications thereto. Any use, reproduction,
# disclosure or distribution of this material and related documentation
# without an express license agreement from NVIDIA CORPORATION or
# its affiliates is strictly prohibited.

resource "aws_lb_target_group" "this" {
  name                 = var.name
  vpc_id               = var.vpc_id
  port                 = var.port
  protocol             = var.protocol
  deregistration_delay = var.deregistration_delay
  dynamic "health_check" {
    for_each = var.health_checks
    content {
      healthy_threshold   = health_check.value["healthy_threshold"]
      unhealthy_threshold = health_check.value["unhealthy_threshold"]
      interval            = health_check.value["interval"]
      matcher             = health_check.value["matcher"]
      path                = health_check.value["path"]
      port                = health_check.value["port"]
      protocol            = health_check.value["protocol"]
      timeout             = health_check.value["timeout"]
    }
  }
  dynamic "stickiness" {
    for_each = var.stickiness
    content {
      cookie_duration = stickiness.value["cookie_duration"]
      type            = stickiness.value["type"]
      cookie_name     = stickiness.value["cookie_name"]
      enabled         = stickiness.value["enabled"]
    }
  }
}

resource "aws_lb_target_group_attachment" "this" {
  count            = length(var.instance_ids)
  target_group_arn = aws_lb_target_group.this.arn
  target_id        = element(var.instance_ids, count.index)
}