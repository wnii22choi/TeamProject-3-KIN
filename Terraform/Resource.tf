resource "nhncloud_networking_vpc_v2" "KIN-PRD-VPC" {
  name    = "KIN-PRD-VPC"
  cidrv4  = "10.200.0.0/16"
  region  = "KR2"
}

resource "nhncloud_networking_vpcsubnet_v2" "KIN-PRD-VPC-BASTION-PUB-A" {
  name    = "KIN-PRD-VPC-BASTION-PUB-A"
  vpc_id  = nhncloud_networking_vpc_v2.KIN-PRD-VPC.id
  cidr    = "10.200.1.0/24"
  region  = "KR2"
}

resource "nhncloud_networking_vpcsubnet_v2" "KIN-PRD-VPC-BASTION-PUB-B" {
  name    = "KIN-PRD-VPC-BASTION-PUB-B"
  vpc_id  = nhncloud_networking_vpc_v2.KIN-PRD-VPC.id
  cidr    = "10.200.2.0/24"
  region  = "KR2"
}

resource "nhncloud_networking_vpcsubnet_v2" "KIN-PRD-VPC-NKS-MANAGED-PRI-A" {
  name    = "KIN-PRD-VPC-NKS-MANAGED-PRI-A"
  vpc_id  = nhncloud_networking_vpc_v2.KIN-PRD-VPC.id
  cidr    = "10.200.3.0/24"
  region  = "KR2"
}

resource "nhncloud_networking_vpcsubnet_v2" "KIN-PRD-VPC-NKS-CLUSTER-PRI-A" {
  name    = "KIN-PRD-VPC-NKS-CLUSTER-PRI-A"
  vpc_id  = nhncloud_networking_vpc_v2.KIN-PRD-VPC.id
  cidr    = "10.200.4.0/24"
  region  = "KR2"
}
resource "nhncloud_networking_vpcsubnet_v2" "KIN-PRD-VPC-PRI-A" {
  name    = "KIN-PRD-VPC-PRI-A"
  vpc_id  = nhncloud_networking_vpc_v2.KIN-PRD-VPC.id
  cidr    = "10.200.5.0/24"
  region  = "KR2"
}

resource "nhncloud_networking_vpcsubnet_v2" "KIN-PRD-VPC-PRI-B" {
  name    = "KIN-PRD-VPC-PRI-B"
  vpc_id  = nhncloud_networking_vpc_v2.KIN-PRD-VPC.id
  cidr    = "10.200.6.0/24"
  region  = "KR2"
}

resource "nhncloud_networking_vpcsubnet_v2" "KIN-PRD-VPC-RDS-PRI-A" {
  name    = "KIN-PRD-VPC-RDS-PRI-A"
  vpc_id  = nhncloud_networking_vpc_v2.KIN-PRD-VPC.id
  cidr    = "10.200.7.0/24"
  region  = "KR2"
}

resource "nhncloud_networking_vpcsubnet_v2" "KIN-PRD-VPC-RDS-PRI-B" {
  name    = "KIN-PRD-VPC-RDS-PRI-B"
  vpc_id  = nhncloud_networking_vpc_v2.KIN-PRD-VPC.id
  cidr    = "10.200.8.0/24"
  region  = "KR2"
}

resource "nhncloud_networking_vpcsubnet_v2" "KIN-PRD-VPC-VPN-A" {
  name    = "KIN-PRD-VPC-VPN-A"
  vpc_id  = nhncloud_networking_vpc_v2.KIN-PRD-VPC.id
  cidr    = "10.200.9.0/24"
  region  = "KR2"
}

#보안그룹 생성
resource "nhncloud_networking_secgroup_v2" "KIN-PRD-VPC-BASTION-PUB-A-SG" {
  name      = "KIN-PRD-VPC-BASTION-PUB-A-SG"
}

resource "nhncloud_networking_secgroup_v2" "KIN-PRD-VPC-BASTION-PUB-B-SG" {
  name      = "KIN-PRD-VPC-BASTION-PUB-B-SG"
}

resource "nhncloud_networking_secgroup_v2" "KIN-PRD-VPC-NKS-MANAGED-PRI-A-SG" {
  name      = "KIN-PRD-VPC-NKS-MANAGED-PRI-A-SG"
}

resource "nhncloud_networking_secgroup_v2" "KIN-PRD-VPC-VPN-A-SG" {
  name      = "KIN-PRD-VPC-VPN-A-SG"
}

#보안규칙 생성
resource "nhncloud_networking_secgroup_rule_v2" "KIN-PRD-VPC-BASTION-PUB-A-SG-rule-01" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = nhncloud_networking_secgroup_v2.KIN-PRD-VPC-BASTION-PUB-A-SG.id
}

resource "nhncloud_networking_secgroup_rule_v2" "KIN-PRD-VPC-BASTION-PUB-A-SG-rule-02" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "icmp"
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = nhncloud_networking_secgroup_v2.KIN-PRD-VPC-BASTION-PUB-A-SG.id
}

resource "nhncloud_networking_secgroup_rule_v2" "KIN-PRD-VPC-BASTION-PUB-B-SG-rule-01" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = nhncloud_networking_secgroup_v2.KIN-PRD-VPC-BASTION-PUB-B-SG.id
}

resource "nhncloud_networking_secgroup_rule_v2" "KIN-PRD-VPC-BASTION-PUB-B-SG-rule-02" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "icmp"
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = nhncloud_networking_secgroup_v2.KIN-PRD-VPC-BASTION-PUB-B-SG.id
}

resource "nhncloud_networking_secgroup_rule_v2" "KIN-PRD-VPC-NKS-MANAGED-PRI-A-SG-rule-01" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = nhncloud_networking_secgroup_v2.KIN-PRD-VPC-NKS-MANAGED-PRI-A-SG.id
}

resource "nhncloud_networking_secgroup_rule_v2" "KIN-PRD-VPC-NKS-MANAGED-PRI-A-SG-rule-02" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "icmp"
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = nhncloud_networking_secgroup_v2.KIN-PRD-VPC-NKS-MANAGED-PRI-A-SG.id
}

resource "nhncloud_networking_secgroup_rule_v2" "KIN-PRD-VPC-VPN-A-SG-rule-01" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = nhncloud_networking_secgroup_v2.KIN-PRD-VPC-VPN-A-SG.id
}

resource "nhncloud_networking_secgroup_rule_v2" "KIN-PRD-VPC-VPN-A-SG-rule-02" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "icmp"
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = nhncloud_networking_secgroup_v2.KIN-PRD-VPC-VPN-A-SG.id
}

# 인스턴스 생성
resource "nhncloud_compute_instance_v2" "tf_instance_01" {
  name               = "KIN-PRD-VPC-BASTION-PUB-A"
  region             = "KR2"
  key_pair           = "NHN-KIN-KR2"
  image_id           = data.nhncloud_images_image_v2.ubuntu.id
  flavor_name        = data.nhncloud_compute_flavor_v2.type.name
  security_groups    = ["KIN-PRD-VPC-BASTION-PUB-A-SG"]
  availability_zone  = "kr2-pub-a"

  network {
    name = "KIN-PRD-VPC"
    uuid = nhncloud_networking_vpc_v2.KIN-PRD-VPC.id
    fixed_ip_v4 = "10.200.1.12"
  }

  block_device {
    uuid                  = data.nhncloud_images_image_v2.ubuntu.id
    source_type           = "image"
    destination_type      = "volume"
    boot_index            = 0
    delete_on_termination = true
    volume_size           = 30
  }
}

resource "nhncloud_compute_instance_v2" "tf_instance_02" {
  name               = "KIN-PRD-VPC-BASTION-PUB-B"
  region             = "KR2"
  key_pair           = "NHN-KIN-KR2"
  image_id           = data.nhncloud_images_image_v2.ubuntu.id
  flavor_name        = data.nhncloud_compute_flavor_v2.type.name
  security_groups    = ["KIN-PRD-VPC-BASTION-PUB-B-SG"]
  availability_zone  = "kr2-pub-b"

  network {
    name = "KIN-PRD-VPC"
    uuid = nhncloud_networking_vpc_v2.KIN-PRD-VPC.id
    fixed_ip_v4 = "10.200.2.12"
  }

  block_device {
    uuid                  = data.nhncloud_images_image_v2.ubuntu.id
    source_type           = "image"
    destination_type      = "volume"
    boot_index            = 0
    delete_on_termination = true
    volume_size           = 30
  }
}

resource "nhncloud_compute_instance_v2" "tf_instance_03" {
  name               = "KIN-PRD-VPC-NKS-MANAGED-PRI-A"
  region             = "KR2"
  key_pair           = "NHN-KIN-KR2"
  image_id           = data.nhncloud_images_image_v2.ubuntu.id
  flavor_name        = data.nhncloud_compute_flavor_v2.type.name
  security_groups    = ["KIN-PRD-VPC-NKS-MANAGED-PRI-A-SG"]
  availability_zone  = "kr2-pub-a"
    destination_type      = "volume"
    boot_index            = 0
    delete_on_termination = true
    volume_size           = 30
  }
}

resource "nhncloud_compute_instance_v2" "tf_instance_04" {
  name               = "KIN-PRD-VPC-VPN-A"
  region             = "KR2"
  key_pair           = "NHN-KIN-KR2"
  image_id           = data.nhncloud_images_image_v2.ubuntu.id
  flavor_name        = data.nhncloud_compute_flavor_v2.type.name
  security_groups    = ["KIN-PRD-VPC-VPN-A-SG"]
  availability_zone  = "kr2-pub-a"

  network {
    name = "KIN-PRD-VPC"
    uuid = nhncloud_networking_vpc_v2.KIN-PRD-VPC.id
    fixed_ip_v4 = "10.200.9.12"
  }

  block_device {
    uuid                  = data.nhncloud_images_image_v2.ubuntu.id
    source_type           = "image"
    destination_type      = "volume"
    boot_index            = 0
    delete_on_termination = true
    volume_size           = 30
  }
}
// data.tf 파일
data "nhncloud_compute_flavor_v2" "type"{
  name = "t2.c1m1"
}

data "nhncloud_images_image_v2" "ubuntu" {
  name = "Ubuntu Server 22.04.4 LTS (2024.05.21)"
  most_recent = true
}
