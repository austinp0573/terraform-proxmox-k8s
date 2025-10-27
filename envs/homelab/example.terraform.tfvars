pm_api_url          = "<url to proxmox host>"
pm_api_token_id     = "<secret token id>"
pm_api_token_secret = "<secret token>"
pm_node             = "<proxmox node name>"
pm_storage          = "<proxmox storage>"


template_name = "<vm template name(template for use making the terraform resources)>" # or the template VMID as string


ssh_user        = "<vm template ssh user>"
ssh_pubkey_path = "<local path to public key to use>"


hostname_prefix = "<hostname prefix>"
domain          = "<domain (lan)"


# fill these with router DHCP reservations
node_ips = {
  cp = [
    "<expample: 192.168.1.31>",
    "<example: 192.168.1.32>",
    "<example:192.168.1.33>",
  ]
  wk = [
    "<example: 192.168.1.41>",
    "<example: 192.168.1.42>",
  ]
}


kube_vip_ip  = "<example: 192.168.1.200>"
metallb_pool = "<example: 192.168.1.201-192.168.1.219>"