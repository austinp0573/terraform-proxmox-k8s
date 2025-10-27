variable "pm_api_url" {
  type = string
}
variable "pm_api_token_id" {
  type = string
}
variable "pm_api_token_secret" {
  type = string
}


variable "pm_node" {
  description = "proxmox node name (ui)"
  type        = string
}

variable "pm_storage" {
  default = "local-zfs"
}


variable "template_name" {
  description = "name or ID of cloud-init VM template"
  type        = string
}


variable "ssh_user" {
  type = string
}
variable "ssh_pubkey_path" {
  type = string
}


variable "bridge" {
  default = "vmbr0"
}


variable "cp_count" {
  default = 3
}
variable "wk_count" {
  default = 2
}


variable "cp_flavor" {
  type = object(
    { cores     = number
      memory_mb = number
      disk_gb   = number
  })
  default = {
    cores     = 2
    memory_mb = 6144
    disk_gb   = 40
  }
}


variable "wk_flavor" {
  type = object({
    cores        = number
    memory_mb    = number
    disk_gb      = number
    data_disk_gb = number
  })
  default = {
    cores        = 4
    memory_mb    = 12288
    disk_gb      = 60
    data_disk_gb = 250
  }
}


variable "hostname_prefix" {
  default = "k3s"
}


variable "domain" {
  default = "lan"
}


# populate with DHCP-reserved IPs so Ansible can connect by IP
variable "node_ips" {
  type = object({
    cp = list(string)
    wk = list(string)
  })
}


variable "metallb_pool" {
  default = "192.168.1.201-192.168.1.219"
}
variable "kube_vip_ip" {
  default = "192.168.1.200"
}
variable "gateway" {
  default = "192.168.1.1"
}
variable "dns_servers" {
  type    = list(string)
  default = ["192.168.1.1"]
}