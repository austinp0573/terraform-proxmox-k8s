locals {
  ssh_key = trimspace(file(var.ssh_pubkey_path))
}


module "cp" {
  source     = "./modules/vm"
  for_each   = { for i in range(var.cp_count) : i => i }
  name       = format("%s-cp-%d", var.hostname_prefix, each.value + 1)
  pm_node    = var.pm_node
  pm_storage = var.pm_storage
  template   = var.template_name
  bridge     = var.bridge
  ssh_user   = var.ssh_user
  ssh_pubkey = local.ssh_key
  cores      = var.cp_flavor.cores
  memory_mb  = var.cp_flavor.memory_mb
  disk_gb    = var.cp_flavor.disk_gb
  domain     = var.domain
}


module "wk" {
  source       = "./modules/vm"
  for_each     = { for i in range(var.wk_count) : i => i }
  name         = format("%s-wk-%d", var.hostname_prefix, each.value + 1)
  pm_node      = var.pm_node
  pm_storage   = var.pm_storage
  template     = var.template_name
  bridge       = var.bridge
  ssh_user     = var.ssh_user
  ssh_pubkey   = local.ssh_key
  cores        = var.wk_flavor.cores
  memory_mb    = var.wk_flavor.memory_mb
  disk_gb      = var.wk_flavor.disk_gb
  data_disk_gb = var.wk_flavor.data_disk_gb
  domain       = var.domain
}


# generate Ansible inventory using DHCP reserved IPs
data "template_file" "inventory" {
  template = file("${path.module}/templates/ansible_inventory.ini.tftpl")
  vars = {
    ssh_user = var.ssh_user
    cp_hosts = jsonencode([for idx in range(var.cp_count) : {
      name = format("%s-cp-%d", var.hostname_prefix, idx + 1)
      ip   = var.node_ips.cp[idx]
    }])
    wk_hosts = jsonencode([for idx in range(var.wk_count) : {
      name = format("%s-wk-%d", var.hostname_prefix, idx + 1)
      ip   = var.node_ips.wk[idx]
    }])
    kube_vip_ip  = var.kube_vip_ip
    metallb_pool = var.metallb_pool
  }
}


resource "local_file" "inventory" {
  filename = "${path.module}/../ansible-k8s/inventory/inventory.ini"
  content  = data.template_file.inventory.rendered
}