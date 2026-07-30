variable "instance" {
  type        = list
  default     = ["mongodb", "mysql", "redis", "rabbitmq", "catalogue", "user", "cart", "payment", "shipping", "frontend"]
}

variable "domain_name" {
  type = string
  default = "rajudevops.online"
}
variable "hosted_zone_id" {
  type = string
  default = "Z02278952F5M8J1BLZYOZ"
}