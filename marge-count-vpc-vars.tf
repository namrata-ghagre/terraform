variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}


variable "instance_tenancy" {
  type    = string
  default = "default"
}

variable "public_subnet" {
  type    = list(any)
  default = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

variable "private_subnet" {
  type    = list(any)
  default = ["10.0.10.0/24", "10.0.11.0/24"]
}

variable "namespace" {
  type    = string
  default = "Dev"
}

variable "common_tag" {
  type = map(any)
  default = {
    Project = "MCOM"
    Team    = "DEVOPS"
  }
}
