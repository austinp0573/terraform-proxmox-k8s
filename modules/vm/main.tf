resource "proxmox_virtual_environment_vm" "this" {
  name        = var.name
  node_name   = var.pm_node
  description = "k3s node"


  operating_system {
    type = "l26"
  }


  initialization {
    datastore_id = var.pm_storage
    user_account {
      username = var.ssh_user
      keys     = [var.ssh_pubkey]
    }
    # DHCP via cloud-init; gateway/DNS handled by router
  }


  cpu {
    cores = var.cores
  }


  memory {
    dedicated = var.memory_mb
  }


  disk {
    datastore_id = var.pm_storage
    interface    = "scsi0"
    size         = var.disk_gb
  }


  dynamic "disk" {
    for_each = var.data_disk_gb > 0 ? [1] : []
    content {
      datastore_id = var.pm_storage
      interface    = "scsi1"
      size         = var.data_disk_gb
    }
  }


  network_device {
    bridge = var.bridge
    model  = "virtio"
  }


  clone {
    vm_id = var.template
  }


  agent {
    enabled = true
  }
}


output "name" { value = proxmox_virtual_environment_vm.this.name }