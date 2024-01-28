variable "instance_count" {
  type    = number
  default = 2

}

variable "instance_type" {
  type    = string
  default = "t2.micro"

}



variable "ami" {
  type = string

  default = "ami-061ea90489f8844ca"
}

variable "sg_name" {
  type    = string
  default = "tf-sg"
}

variable "vpc_id" {
  type    = string
  default = "vpc-0b0a98f4c71cbd616"

}

locals {
  ingress_rules = [{
    port        = "22"
    description = "This port is used for SSH"
    },
    {
      port        = "80"
      description = "This port is used for nginx"
    },
    {
      port        = "8080"
      description = "This port is used for Webserver"
    },
    {
      port        = "443"
 description = "This port is used for SSL"
    }
  ]
}

variable "namespace" {
  type    = string
  default = "Dev"

}

variable "sg_tags" {
  type = map(any)
  default = {
    Team    = "DevOps"
    project = "ECOM"
  }
}
