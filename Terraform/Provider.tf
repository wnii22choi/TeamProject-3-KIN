# Define required providers
terraform {
required_version = ">= 1.0.0"
  required_providers {
    nhncloud = {
      source  = "terraform.local/local/nhncloud"
      version = "1.0.2"
    }
  }
}

# Configure the nhncloud Provider
provider "nhncloud" {
  user_name   = "olimecner@naver.com"
  tenant_id   = "ae9e97a443d44648b8f3b89fb1e3ebb4"
  password    = "password"
  auth_url    = "https://api-identity-infrastructure.nhncloudservice.com/v2.0"
  region      = "KR1"
}
provider "nhncloud" {
  user_name   = "olimecner@naver.com"
  tenant_id   = "ae9e97a443d44648b8f3b89fb1e3ebb4"
  password    = "password"
  auth_url    = "https://api-identity-infrastructure.nhncloudservice.com/v2.0"
  region      = "KR2"
}