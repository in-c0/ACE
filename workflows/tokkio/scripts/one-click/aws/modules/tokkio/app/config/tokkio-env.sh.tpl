#!/bin/bash

# SPDX-FileCopyrightText: Copyright (c) 2024 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
# SPDX-License-Identifier: LicenseRef-NvidiaProprietary
#
# NVIDIA CORPORATION, its affiliates and licensors retain all intellectual
# property and proprietary rights in and to this material, related
# documentation and any modifications thereto. Any use, reproduction,
# disclosure or distribution of this material and related documentation
# without an express license agreement from NVIDIA CORPORATION or
# its affiliates is strictly prohibited.

export USE_TWILIO_TURN_SERVER=${use_twilio}
export TURNURL_CONN_STRING="${coturn.username}:${coturn.password}@${coturn.public_ip}:${coturn.port}"
export TWILIO_ACCOUNT_SID="${twilio.account_sid}"
export TWILIO_AUTH_TOKEN="${twilio.auth_token}"
export MLOPS_ENV="${name}-tokkio-aws"
export NGC_CLI_API_KEY="${ngc_api_key}"
export WEATHER_API_KEY="${weather_api_key}"
export OPENAI_API_KEY="${openai_api_key}"
export ENABLE_IDP_AUTH=false
export UI_END_POINT="https://${ui_domain}"
export API_DOMAIN="${api_domain}"
export TOKKIO_API_CHART_URL="${api_chart_url}"
export TOKKIO_UI_RESOURCE_URL="${ui_resource_url}"
export TOKKIO_UI_FILE="${ui_file}"
export MLOPS_AWS_ACCESS_KEY_ID="${mlops.aws_access_key_id}"
export MLOPS_AWS_SECRET_ACCESS_KEY="${mlops.aws_secret_access_key}"
export MLOPS_S3_BUCKET="${mlops.bucket_name}"
export MLOPS_S3_REGION="${mlops.bucket_region}"
export WEB_ASSETS_BUCKET_ID="${ui_bucket}"
export VST_ENDPOINT="${vst_endpoint}"
export UI_SERVER_ENDPOINT="${ui_server_endpoint}"
export WEBSOCKET_ENPOINT="${websocket_endpoint}"
export VST_WEBSOCKET_ENPOINT="${vst_websocket_endpoint}"
export COUNTDOWN_VALUE=${countdown_value}
export ENABLE_COUNTDOWN=${enable_countdown}
export ENABLE_CAMERA=${enable_camera}
export APP_TITLE="${app_title}"
export BOT_CONFIG_NAME="${bot_config_name}"
export CONTEXT_GENERAL_SEARCH="${context_general_search}"
export RP_INSTANCE_IP="${rp_instance_ip}"
export USE_REVERSE_PROXY="${use_reverse_proxy}"
export NEMO_LLM_ORG_TEAM="${nemo_llm_org_team}"
export APPLICATION_TYPE="${application_type}"
export OVERLAY_VISIBLE=${overlay_visible}
export UI_WINDOW_VISIBLE=${ui_window_visible}
export OPS_ES_CLUSTER_NAME=${ops_es_cluster_name}
export ELASTIC_DOMAIN="${elastic_domain}"
export KIBANA_DOMAIN="${kibana_domain}"
export GRAFANA_DOMAIN="${grafana_domain}"
export INGRESS_CONTROLLER_CHART_URL=${ingress_controller_chart_url}
export LOGGING_ELASTIC_KIBANA_CHART_URL=${logging_elastic_kibana_chart_url}
export LOGGING_FLUENTBIT_CHART_URL=${logging_fluentbit_chart_URL}
export PROMETHEUS_STACK_CHART_URL=${prometheus_stack_chart_url}
export API_NS=${api_ns}
export OPS_NS=${ops_ns}
export FOUNDATIONAL_NS=${foundational_ns}
export CNS_COMMIT=${cns_commit}
export CNS_VERSION=${cns_version}
export GPU_DRIVER_RUNFILE_INSTALL=${gpu_driver_runfile_install}
export GPU_DRIVER_VERSION=${gpu_driver_version}
