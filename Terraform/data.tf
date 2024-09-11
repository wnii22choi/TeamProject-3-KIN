#Image Data Source
data "nhncloud_images_image_v2" "ubuntu" {
  name = "Ubuntu Server 20.04.6 LTS (2024.05.21)"
  most_recent = true
}

#Flaovr Name
data "nhncloud_compute_flavor_v2" "type"{
  name = "t2.c1m1"
}

#VPC Network
data "nhncloud_networking_vpc_v2" "VPC_network" {
  region = "KR1"
  tenant_id = "ae9e97a443d44648b8f3b89fb1e3ebb4"
  id = "c8d76f1e-0dcf-463a-8286-12ffe16888ab"
  name = "KIN-VPC-PRD"
}

#VPC Subnet
data "nhncloud_networking_vpcsubnet_v2" "PRI_subnet" {
  region = "KR1"
  tenant_id = "ae9e97a443d44648b8f3b89fb1e3ebb4"
  id = "5f5dfaa2-92dc-44be-9953-01368bb0cbc7"
  name = "KIN-PRI-SUB-2A"
  shared = false
}

data "nhncloud_networking_vpcsubnet_v2" "PUB_subnet" {
  region = "KR1"
  tenant_id = "ae9e97a443d44648b8f3b89fb1e3ebb4"
  id = "2ea2d20d-e069-412e-9089-9d1732935a98"
  name = "KIN-PUB-MGT-SUB-2A"
  shared = false
}

#Routing Table
data "nhncloud_networking_routingtable_v2" "pri_rt" {
  id = "1922bb8f-445e-4deb-948c-64e271b827be"
}

data "nhncloud_networking_routingtable_v2" "pub_rt" {
  id = "e64f8def-468d-4040-969f-607e122e8398"
}

#Security Group
data "nhncloud_networking_secgroup_v2" "web_sg" {
  name = "WEB-SG"
}

data "nhncloud_networking_secgroup_v2" "was_sg" {
  name = "WAS-SG"
}

data "nhncloud_networking_secgroup_v2" "db_sg" {
  name = "DB-SG"
}
