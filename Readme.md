C:\Users\divat\OneDrive\Documents\OneDrive\Desktop\devops final assignment> terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following
symbols:
  + create

Terraform will perform the following actions:

  # module.ITSALB.aws_lb.main will be created
  + resource "aws_lb" "main" {
      + arn                                                          = (known after apply)
      + arn_suffix                                                   = (known after apply)
      + client_keep_alive                                            = 3600
      + desync_mitigation_mode                                       = "defensive"
      + dns_name                                                     = (known after apply)
      + drop_invalid_header_fields                                   = false
      + enable_deletion_protection                                   = false
      + enable_http2                                                 = true
      + enable_tls_version_and_cipher_suite_headers                  = false
      + enable_waf_fail_open                                         = false
      + enable_xff_client_port                                       = false
      + enable_zonal_shift                                           = false
      + enforce_security_group_inbound_rules_on_private_link_traffic = (known after apply)
      + id                                                           = (known after apply)
      + idle_timeout                                                 = 60
      + internal                                                     = false
      + ip_address_type                                              = (known after apply)
      + load_balancer_type                                           = "application"
      + name                                                         = (known after apply)
      + name_prefix                                                  = (known after apply)
      + preserve_host_header                                         = false
      + region                                                       = "ap-northeast-2"
      + secondary_ips_auto_assigned_per_subnet                       = (known after apply)
      + security_groups                                              = (known after apply)
      + subnets                                                      = (known after apply)
      + tags                                                         = {
          + "Environment" = "production"
          + "Name"        = "main-alb"
        }
      + tags_all                                                     = {
          + "Environment" = "production"
          + "Name"        = "main-alb"
        }
      + vpc_id                                                       = (known after apply)
      + xff_header_processing_mode                                   = "append"
      + zone_id                                                      = (known after apply)

      + access_logs {
          + enabled = false
            # (1 unchanged attribute hidden)
        }

      + subnet_mapping (known after apply)
    }

  # module.ITSALB.aws_lb_listener.http will be created
  + resource "aws_lb_listener" "http" {
      + arn                                                                   = (known after apply)
      + id                                                                    = (known after apply)
      + load_balancer_arn                                                     = (known after apply)
      + port                                                                  = 80
      + protocol                                                              = "HTTP"
      + region                                                                = "ap-northeast-2"
      + routing_http_request_x_amzn_mtls_clientcert_header_name               = (known after apply)
      + routing_http_request_x_amzn_mtls_clientcert_issuer_header_name        = (known after apply)
      + routing_http_request_x_amzn_mtls_clientcert_leaf_header_name          = (known after apply)
      + routing_http_request_x_amzn_mtls_clientcert_serial_number_header_name = (known after apply)
      + routing_http_request_x_amzn_mtls_clientcert_subject_header_name       = (known after apply)
      + routing_http_request_x_amzn_mtls_clientcert_validity_header_name      = (known after apply)
      + routing_http_request_x_amzn_tls_cipher_suite_header_name              = (known after apply)
      + routing_http_request_x_amzn_tls_version_header_name                   = (known after apply)
      + routing_http_response_access_control_allow_credentials_header_value   = (known after apply)
      + routing_http_response_access_control_allow_headers_header_value       = (known after apply)
      + routing_http_response_access_control_allow_methods_header_value       = (known after apply)
      + routing_http_response_access_control_allow_origin_header_value        = (known after apply)
      + routing_http_response_access_control_expose_headers_header_value      = (known after apply)
      + routing_http_response_access_control_max_age_header_value             = (known after apply)
      + routing_http_response_content_security_policy_header_value            = (known after apply)
      + routing_http_response_server_enabled                                  = (known after apply)
      + routing_http_response_strict_transport_security_header_value          = (known after apply)
      + routing_http_response_x_content_type_options_header_value             = (known after apply)
      + routing_http_response_x_frame_options_header_value                    = (known after apply)
      + ssl_policy                                                            = (known after apply)
      + tags_all                                                              = (known after apply)
      + tcp_idle_timeout_seconds                                              = (known after apply)

      + default_action {
          + order            = (known after apply)
          + target_group_arn = (known after apply)
          + type             = "forward"
        }

      + mutual_authentication (known after apply)
    }

  # module.ITSALB.aws_lb_target_group.main will be created
  + resource "aws_lb_target_group" "main" {
      + arn                                = (known after apply)
      + arn_suffix                         = (known after apply)
      + connection_termination             = (known after apply)
      + deregistration_delay               = "300"
      + id                                 = (known after apply)
      + ip_address_type                    = (known after apply)
      + lambda_multi_value_headers_enabled = false
      + load_balancer_arns                 = (known after apply)
      + load_balancing_algorithm_type      = (known after apply)
      + load_balancing_anomaly_mitigation  = (known after apply)
      + load_balancing_cross_zone_enabled  = (known after apply)
      + name                               = (known after apply)
      + name_prefix                        = (known after apply)
      + port                               = 80
      + preserve_client_ip                 = (known after apply)
      + protocol                           = "HTTP"
      + protocol_version                   = (known after apply)
      + proxy_protocol_v2                  = false
      + region                             = "ap-northeast-2"
      + slow_start                         = 0
      + tags                               = {
          + "Environment" = "production"
          + "Name"        = "main-alb-tg"
        }
      + tags_all                           = {
          + "Environment" = "production"
          + "Name"        = "main-alb-tg"
        }
      + target_type                        = "instance"
      + vpc_id                             = (known after apply)

      + health_check {
          + enabled             = true
          + healthy_threshold   = 3
          + interval            = 30
          + matcher             = "200"
          + path                = "/"
          + port                = "traffic-port"
          + protocol            = "HTTP"
          + timeout             = 5
          + unhealthy_threshold = 3
        }

      + stickiness (known after apply)

      + target_failover (known after apply)

      + target_group_health {
          + dns_failover {
              + minimum_healthy_targets_count      = "1"
              + minimum_healthy_targets_percentage = "off"
            }
          + unhealthy_state_routing {
              + minimum_healthy_targets_count      = 1
              + minimum_healthy_targets_percentage = "off"
            }
        }

      + target_health_state (known after apply)
    }

  # module.ITSALB.aws_security_group.alb will be created
  + resource "aws_security_group" "alb" {
      + arn                    = (known after apply)
      + description            = "Managed by Terraform"
      + egress                 = (known after apply)
      + id                     = (known after apply)
      + ingress                = (known after apply)
      + name                   = "alb-sg"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + region                 = "ap-northeast-2"
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Environment" = "production"
          + "Name"        = "alb-sg"
        }
      + tags_all               = {
          + "Environment" = "production"
          + "Name"        = "alb-sg"
        }
      + vpc_id                 = (known after apply)
    }

  # module.ITSALB.aws_vpc_security_group_egress_rule.alb_allow_all_ipv4 will be created
  + resource "aws_vpc_security_group_egress_rule" "alb_allow_all_ipv4" {
      + arn                    = (known after apply)
      + cidr_ipv4              = "0.0.0.0/0"
      + id                     = (known after apply)
      + ip_protocol            = "-1"
      + region                 = "ap-northeast-2"
      + security_group_id      = (known after apply)
      + security_group_rule_id = (known after apply)
      + tags_all               = {}
    }

  # module.ITSALB.aws_vpc_security_group_ingress_rule.alb_allow_http_ipv4 will be created
  + resource "aws_vpc_security_group_ingress_rule" "alb_allow_http_ipv4" {
      + arn                    = (known after apply)
      + cidr_ipv4              = "0.0.0.0/0"
      + from_port              = 80
      + id                     = (known after apply)
      + ip_protocol            = "tcp"
      + region                 = "ap-northeast-2"
      + security_group_id      = (known after apply)
      + security_group_rule_id = (known after apply)
      + tags_all               = {}
      + to_port                = 80
    }

  # module.ITSEC2.aws_instance.ec2_server_1 will be created
  + resource "aws_instance" "ec2_server_1" {
      + ami                                  = "ami-0c003e98ceffee43e"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = (known after apply)
      + availability_zone                    = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + enable_primary_ipv6                  = (known after apply)
      + force_destroy                        = false
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = (known after apply)
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_lifecycle                   = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t3.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = (known after apply)
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_group_id                   = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + region                               = "ap-northeast-2"
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + spot_instance_request_id             = (known after apply)
      + subnet_id                            = (known after apply)
      + tags                                 = {
          + "Name" = "ec2-server-1"
        }
      + tags_all                             = {
          + "Name" = "ec2-server-1"
        }
      + tenancy                              = (known after apply)
      + user_data                            = <<-EOT
            #!/bin/bash
            yum install -y httpd
            systemctl start httpd
            systemctl enable httpd
            echo "Server 1" > /var/www/html/index.html
        EOT
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)

      + capacity_reservation_specification (known after apply)

      + cpu_options (known after apply)

      + ebs_block_device (known after apply)

      + enclave_options (known after apply)

      + ephemeral_block_device (known after apply)

      + instance_market_options (known after apply)

      + maintenance_options (known after apply)

      + metadata_options (known after apply)

      + network_interface (known after apply)

      + primary_network_interface (known after apply)

      + private_dns_name_options (known after apply)

      + root_block_device (known after apply)

      + secondary_network_interface (known after apply)
    }

  # module.ITSEC2.aws_instance.ec2_server_2 will be created
  + resource "aws_instance" "ec2_server_2" {
      + ami                                  = "ami-0c003e98ceffee43e"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = (known after apply)
      + availability_zone                    = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + enable_primary_ipv6                  = (known after apply)
      + force_destroy                        = false
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = (known after apply)
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_lifecycle                   = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t3.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = (known after apply)
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_group_id                   = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + region                               = "ap-northeast-2"
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + spot_instance_request_id             = (known after apply)
      + subnet_id                            = (known after apply)
      + tags                                 = {
          + "Name" = "ec2-server-2"
        }
      + tags_all                             = {
          + "Name" = "ec2-server-2"
        }
      + tenancy                              = (known after apply)
      + user_data                            = <<-EOT
            #!/bin/bash
             yum install -y httpd
             systemctl start httpd
             systemctl enable httpd
             echo "Server 2" > /var/www/html/index.html
        EOT
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)

      + capacity_reservation_specification (known after apply)

      + cpu_options (known after apply)

      + ebs_block_device (known after apply)

      + enclave_options (known after apply)

      + ephemeral_block_device (known after apply)

      + instance_market_options (known after apply)

      + maintenance_options (known after apply)

      + metadata_options (known after apply)

      + network_interface (known after apply)

      + primary_network_interface (known after apply)

      + private_dns_name_options (known after apply)

      + root_block_device (known after apply)

      + secondary_network_interface (known after apply)
    }

  # module.ITSEC2.aws_security_group.ec2_sg will be created
  + resource "aws_security_group" "ec2_sg" {
      + arn                    = (known after apply)
      + description            = "Managed by Terraform"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
                # (1 unchanged attribute hidden)
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + from_port        = 80
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 80
                # (1 unchanged attribute hidden)
            },
        ]
      + name                   = "ec2-sg"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + region                 = "ap-northeast-2"
      + revoke_rules_on_delete = false
      + tags_all               = (known after apply)
      + vpc_id                 = (known after apply)
    }

  # module.ITSVPC.aws_eip.nat will be created
  + resource "aws_eip" "nat" {
      + allocation_id        = (known after apply)
      + arn                  = (known after apply)
      + association_id       = (known after apply)
      + carrier_ip           = (known after apply)
      + customer_owned_ip    = (known after apply)
      + domain               = "vpc"
      + id                   = (known after apply)
      + instance             = (known after apply)
      + ipam_pool_id         = (known after apply)
      + network_border_group = (known after apply)
      + network_interface    = (known after apply)
      + private_dns          = (known after apply)
      + private_ip           = (known after apply)
      + ptr_record           = (known after apply)
      + public_dns           = (known after apply)
      + public_ip            = (known after apply)
      + public_ipv4_pool     = (known after apply)
      + region               = "ap-northeast-2"
      + tags                 = {
          + "Name" = "first-gateway-eip"
        }
      + tags_all             = {
          + "Name" = "first-gateway-eip"
        }
    }

  # module.ITSVPC.aws_internet_gateway.whata_igw will be created
  + resource "aws_internet_gateway" "whata_igw" {
      + arn      = (known after apply)
      + id       = (known after apply)
      + owner_id = (known after apply)
      + region   = "ap-northeast-2"
      + tags     = {
          + "Name" = "whata-igw"
        }
      + tags_all = {
          + "Name" = "whata-igw"
        }
      + vpc_id   = (known after apply)
    }

  # module.ITSVPC.aws_nat_gateway.main will be created
  + resource "aws_nat_gateway" "main" {
      + allocation_id                      = (known after apply)
      + association_id                     = (known after apply)
      + auto_provision_zones               = (known after apply)
      + auto_scaling_ips                   = (known after apply)
      + availability_mode                  = (known after apply)
      + connectivity_type                  = "public"
      + id                                 = (known after apply)
      + network_interface_id               = (known after apply)
      + private_ip                         = (known after apply)
      + public_ip                          = (known after apply)
      + region                             = "ap-northeast-2"
      + regional_nat_gateway_address       = (known after apply)
      + regional_nat_gateway_auto_mode     = (known after apply)
      + route_table_id                     = (known after apply)
      + secondary_allocation_ids           = (known after apply)
      + secondary_private_ip_address_count = (known after apply)
      + secondary_private_ip_addresses     = (known after apply)
      + subnet_id                          = (known after apply)
      + tags                               = {
          + "Name" = "first-gateway"
        }
      + tags_all                           = {
          + "Name" = "first-gateway"
        }
      + vpc_id                             = (known after apply)
    }

  # module.ITSVPC.aws_route_table.private_rt will be created
  + resource "aws_route_table" "private_rt" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + region           = "ap-northeast-2"
      + route            = [
          + {
              + cidr_block                 = "0.0.0.0/0"
              + nat_gateway_id             = (known after apply)
                # (11 unchanged attributes hidden)
            },
        ]
      + tags_all         = (known after apply)
      + vpc_id           = (known after apply)
    }

  # module.ITSVPC.aws_route_table.public_rt will be created
  + resource "aws_route_table" "public_rt" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + region           = "ap-northeast-2"
      + route            = [
          + {
              + cidr_block                 = "0.0.0.0/0"
              + gateway_id                 = (known after apply)
                # (11 unchanged attributes hidden)
            },
        ]
      + tags_all         = (known after apply)
      + vpc_id           = (known after apply)
    }

  # module.ITSVPC.aws_route_table_association.private_subnet_1 will be created
  + resource "aws_route_table_association" "private_subnet_1" {
      + id             = (known after apply)
      + region         = "ap-northeast-2"
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.ITSVPC.aws_route_table_association.private_subnet_2 will be created
  + resource "aws_route_table_association" "private_subnet_2" {
      + id             = (known after apply)
      + region         = "ap-northeast-2"
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.ITSVPC.aws_route_table_association.public_subnet_1 will be created
  + resource "aws_route_table_association" "public_subnet_1" {
      + id             = (known after apply)
      + region         = "ap-northeast-2"
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.ITSVPC.aws_route_table_association.public_subnet_2 will be created
  + resource "aws_route_table_association" "public_subnet_2" {
      + id             = (known after apply)
      + region         = "ap-northeast-2"
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.ITSVPC.aws_subnet.private_subnet_1 will be created
  + resource "aws_subnet" "private_subnet_1" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "ap-northeast-2a"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.3.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block                                = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + region                                         = "ap-northeast-2"
      + tags                                           = {
          + "Name" = "Private-subnet-1"
        }
      + tags_all                                       = {
          + "Name" = "Private-subnet-1"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.ITSVPC.aws_subnet.private_subnet_2 will be created
  + resource "aws_subnet" "private_subnet_2" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "ap-northeast-2b"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.4.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block                                = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + region                                         = "ap-northeast-2"
      + tags                                           = {
          + "Name" = "Private-subnet-2"
        }
      + tags_all                                       = {
          + "Name" = "Private-subnet-2"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.ITSVPC.aws_subnet.public_subnet_1 will be created
  + resource "aws_subnet" "public_subnet_1" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "ap-northeast-2a"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.1.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block                                = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = true
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + region                                         = "ap-northeast-2"
      + tags                                           = {
          + "Name" = "public-subnet-1"
        }
      + tags_all                                       = {
          + "Name" = "public-subnet-1"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.ITSVPC.aws_subnet.public_subnet_2 will be created
  + resource "aws_subnet" "public_subnet_2" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "ap-northeast-2b"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.2.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block                                = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = true
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + region                                         = "ap-northeast-2"
      + tags                                           = {
          + "Name" = "public-subnet-2"
        }
      + tags_all                                       = {
          + "Name" = "public-subnet-2"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.ITSVPC.aws_vpc.super_vpc will be created
  + resource "aws_vpc" "super_vpc" {
      + arn                                  = (known after apply)
      + cidr_block                           = "10.0.0.0/16"
      + default_network_acl_id               = (known after apply)
      + default_route_table_id               = (known after apply)
      + default_security_group_id            = (known after apply)
      + dhcp_options_id                      = (known after apply)
      + enable_dns_hostnames                 = (known after apply)
      + enable_dns_support                   = true
      + enable_network_address_usage_metrics = (known after apply)
      + id                                   = (known after apply)
      + instance_tenancy                     = "default"
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + ipv6_cidr_block_network_border_group = (known after apply)
      + main_route_table_id                  = (known after apply)
      + owner_id                             = (known after apply)
      + region                               = "ap-northeast-2"
      + tags                                 = {
          + "Name" = "super-vpc"
        }
      + tags_all                             = {
          + "Name" = "super-vpc"
        }
    }

Plan: 23 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + PrivateSubnetIDs = [
      + (known after apply),
      + (known after apply),
    ]
  + PublicSubnetIDs  = [
      + (known after apply),
      + (known after apply),
    ]
  + alb_dns_name     = (known after apply)
  + vpc_id           = (known after apply)

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

module.ITSVPC.aws_eip.nat: Creating...
module.ITSVPC.aws_vpc.super_vpc: Creating...
module.ITSVPC.aws_eip.nat: Creation complete after 4s [id=eipalloc-00430c8d497807edd]
module.ITSVPC.aws_vpc.super_vpc: Creation complete after 6s [id=vpc-07b51430fbfa0345a]
module.ITSVPC.aws_subnet.private_subnet_2: Creating...
module.ITSVPC.aws_internet_gateway.whata_igw: Creating...
module.ITSVPC.aws_subnet.private_subnet_1: Creating...
module.ITSVPC.aws_subnet.public_subnet_1: Creating...
module.ITSVPC.aws_subnet.public_subnet_2: Creating...
module.ITSEC2.aws_security_group.ec2_sg: Creating...
module.ITSALB.aws_lb_target_group.main: Creating...
module.ITSALB.aws_security_group.alb: Creating...
module.ITSVPC.aws_internet_gateway.whata_igw: Creation complete after 2s [id=igw-0c0dd866ead53ad3f]
module.ITSVPC.aws_subnet.private_subnet_2: Creation complete after 2s [id=subnet-0ed0febedc265f110]
module.ITSVPC.aws_route_table.public_rt: Creating...
module.ITSVPC.aws_subnet.private_subnet_1: Creation complete after 3s [id=subnet-0d4f4fe4cdea5ebfb]
module.ITSALB.aws_lb_target_group.main: Creation complete after 4s [id=arn:aws:elasticloadbalancing:ap-northeast-2:660815084882:targetgroup/tf-20260428130437498800000001/24fc8188f4e761b4]
module.ITSVPC.aws_route_table.public_rt: Creation complete after 3s [id=rtb-0fce6c432512d8af3]
module.ITSALB.aws_security_group.alb: Creation complete after 5s [id=sg-0510064fd9c136aef]
module.ITSALB.aws_vpc_security_group_ingress_rule.alb_allow_http_ipv4: Creating...
module.ITSALB.aws_vpc_security_group_egress_rule.alb_allow_all_ipv4: Creating...
module.ITSALB.aws_vpc_security_group_ingress_rule.alb_allow_http_ipv4: Creation complete after 1s [id=sgr-0bb69ca99b9a15112]
module.ITSALB.aws_vpc_security_group_egress_rule.alb_allow_all_ipv4: Creation complete after 1s [id=sgr-042c097cfec1c4342]
module.ITSEC2.aws_security_group.ec2_sg: Creation complete after 8s [id=sg-0716570154a26294e]
module.ITSEC2.aws_instance.ec2_server_2: Creating...
module.ITSEC2.aws_instance.ec2_server_1: Creating...
module.ITSVPC.aws_subnet.public_subnet_1: Still creating... [00m10s elapsed]
module.ITSVPC.aws_subnet.public_subnet_2: Still creating... [00m10s elapsed]
module.ITSVPC.aws_subnet.public_subnet_2: Creation complete after 13s [id=subnet-0dff6e63c88eef54a]
module.ITSVPC.aws_route_table_association.public_subnet_2: Creating...
module.ITSVPC.aws_subnet.public_subnet_1: Creation complete after 13s [id=subnet-0334ed857c122e44e]
module.ITSVPC.aws_route_table_association.public_subnet_1: Creating...
module.ITSVPC.aws_nat_gateway.main: Creating...
module.ITSALB.aws_lb.main: Creating...
module.ITSVPC.aws_route_table_association.public_subnet_1: Creation complete after 1s [id=rtbassoc-0d888b0457723a59d]
module.ITSVPC.aws_route_table_association.public_subnet_2: Creation complete after 2s [id=rtbassoc-0079184f4ddb392ae]
module.ITSEC2.aws_instance.ec2_server_2: Still creating... [00m10s elapsed]
module.ITSEC2.aws_instance.ec2_server_1: Still creating... [00m10s elapsed]
module.ITSVPC.aws_nat_gateway.main: Still creating... [00m10s elapsed]
module.ITSALB.aws_lb.main: Still creating... [00m10s elapsed]
module.ITSEC2.aws_instance.ec2_server_2: Creation complete after 16s [id=i-0f4cee299f160c86b]
module.ITSEC2.aws_instance.ec2_server_1: Creation complete after 18s [id=i-0f6478930f47430c2]
module.ITSVPC.aws_nat_gateway.main: Still creating... [00m20s elapsed]
module.ITSALB.aws_lb.main: Still creating... [00m20s elapsed]
module.ITSVPC.aws_nat_gateway.main: Still creating... [00m30s elapsed]
module.ITSALB.aws_lb.main: Still creating... [00m30s elapsed]
module.ITSVPC.aws_nat_gateway.main: Still creating... [00m40s elapsed]
module.ITSALB.aws_lb.main: Still creating... [00m40s elapsed]
module.ITSVPC.aws_nat_gateway.main: Still creating... [00m50s elapsed]
module.ITSALB.aws_lb.main: Still creating... [00m50s elapsed]
module.ITSVPC.aws_nat_gateway.main: Still creating... [01m00s elapsed]
module.ITSALB.aws_lb.main: Still creating... [01m00s elapsed]
module.ITSVPC.aws_nat_gateway.main: Still creating... [01m10s elapsed]
module.ITSALB.aws_lb.main: Still creating... [01m10s elapsed]
module.ITSVPC.aws_nat_gateway.main: Still creating... [01m20s elapsed]
module.ITSALB.aws_lb.main: Still creating... [01m20s elapsed]
module.ITSVPC.aws_nat_gateway.main: Still creating... [01m30s elapsed]
module.ITSALB.aws_lb.main: Still creating... [01m30s elapsed]
module.ITSVPC.aws_nat_gateway.main: Creation complete after 1m32s [id=nat-00a3f5e79b1bd0dab]
module.ITSVPC.aws_route_table.private_rt: Creating...
module.ITSVPC.aws_route_table.private_rt: Creation complete after 3s [id=rtb-0b1ae8a52fea8de82]
module.ITSVPC.aws_route_table_association.private_subnet_2: Creating...
module.ITSVPC.aws_route_table_association.private_subnet_1: Creating...
module.ITSVPC.aws_route_table_association.private_subnet_1: Creation complete after 1s [id=rtbassoc-07ea77194fd2fd2e1]
module.ITSVPC.aws_route_table_association.private_subnet_2: Creation complete after 2s [id=rtbassoc-0c135f1c217641e4f]
module.ITSALB.aws_lb.main: Still creating... [01m40s elapsed]
module.ITSALB.aws_lb.main: Still creating... [01m50s elapsed]
module.ITSALB.aws_lb.main: Still creating... [02m00s elapsed]
module.ITSALB.aws_lb.main: Still creating... [02m10s elapsed]
module.ITSALB.aws_lb.main: Still creating... [02m20s elapsed]
module.ITSALB.aws_lb.main: Creation complete after 2m28s [id=arn:aws:elasticloadbalancing:ap-northeast-2:660815084882:loadbalancer/app/tf-lb-20260428130450387900000002/18acc5bf37e31da7]
module.ITSALB.aws_lb_listener.http: Creating...
module.ITSALB.aws_lb_listener.http: Creation complete after 2s [id=arn:aws:elasticloadbalancing:ap-northeast-2:660815084882:listener/app/tf-lb-20260428130450387900000002/18acc5bf37e31da7/9c52fafb66a82620]

Apply complete! Resources: 23 added, 0 changed, 0 destroyed.

Outputs:

PrivateSubnetIDs = [
  "subnet-0d4f4fe4cdea5ebfb",
  "subnet-0ed0febedc265f110",
]
PublicSubnetIDs = [
  "subnet-0334ed857c122e44e",
  "subnet-0dff6e63c88eef54a",
]
alb_dns_name = "tf-lb-20260428130450387900000002-59101282.ap-northeast-2.elb.amazonaws.com"
vpc_id = "vpc-07b51430fbfa0345a"
PS C:\Users\divat\OneDrive\Documents\OneDrive\Desktop\devops final assignment> 

