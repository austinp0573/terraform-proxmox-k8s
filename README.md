# terraform-proxmox-k8s

creates 3× control-plane + 2× worker VMs on Proxmox from a cloud-init template, then writes an Ansible inventory.

## Quick start
1. export Proxmox API creds:
   ```bash
   export PM_API_URL="https://pve.lan:8006/api2/json"
   export PM_API_TOKEN_ID="terraform@pve!tf"
   export PM_API_TOKEN_SECRET="<redacted>"
   ``` {data-source-line="87"}
2. edit `envs/homelab/terraform.tfvars`
3. `make init plan apply`
4. go to `ansible-k8s/` → `make k3s` to install the cluster.

> inventory is generated at `../ansible-k8s/inventory/inventory.ini`.