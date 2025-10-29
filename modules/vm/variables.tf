variable "name" {
  type = string
}

variable "pm_node" {
  type = string
}

variable "pm_storage" {
  type = string
}

variable "template" {
  type = string
}

variable "bridge" {
  type = string
}

variable "ssh_user" {
  type      = string
  sensitive = true
}

variable "ssh_pubkey" {
  type      = string
  sensitive = true
}

variable "cpu_type" {
  type = string
}

variable "cores" {
  type = number
}

variable "memory_mb" {
  type = number
}

variable "disk_gb" {
  type = number
}

variable "ssd" {
  type    = bool
  default = true
}

variable "discard" {
  type    = string
  default = "on"
}

variable "data_disk_gb" {
  type    = number
  default = 0
}

variable "ip_address" {
  type      = string
  sensitive = true
}

variable "gateway" {
  type = string
}

variable "domain" {
  type = string
}