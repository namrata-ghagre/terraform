variable "instance_type" {
  type    = list(any)
  default = ["t2.micro", "c5.xlarge", "t2.nano"]
}

variable "instance_tags" {
  type = map(string)
  default = {
    "Name" = "Web-Server"
    "team" = "DevOps"
  }
}

variable "instance_az" {
  type    = string
  default = "us-west-1c"
}

variable "sg_name" {
  type    = string
  default = "web_sg"
}

variable "sg_description" {
  type    = string
  default = "this allow web port"
}

variable "vpc_id" {
  type    = string
  default = "vpc-0b0a98f4c71cbd616"
}

variable "sg_tags" {
  type = map(string)
  default = {
    "name"  = "sg_web"
    "ports" = "80,8080,22"
  }
}

variable "bucket_name" {
  type    = string
  default = "2000-bucket-b19-devops"
}

variable "bucket_tags" {
  type = map(string)
  default = {
    "Name"        = "Development"
    "Environment" = "Dev"
  }
}

variable "user_name" {
  type    = string
  default = "Accountant"
}

variable "user_tags" {
  type = map(string)
  default = {
    "team" = "Devops"
  }
}

