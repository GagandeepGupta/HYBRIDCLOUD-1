# HYBRIDCLOUD-1


## TERRAFORM 

### INFRASTRUCTURE AS A CODE

Write Infrastructure as Code
Terraform users define infrastructure in a simple, human-readable configuration language called HCL (HashiCorp Configuration Language). Users can write unique HCL configuration files or borrow existing templates from the public module registry.

### Manage Configuration Files in VCS

Most users will store their configuration files in a version control system (VCS) repository and connect that repository to a Terraform Cloud workspace. With that connection in place, users can borrow best practices from software engineering to version and iterate on infrastructure as code, using VCS and Terraform Cloud as a delivery pipeline for infrastructure.

### Automate Provisioning

When you push changes to a connected VCS repository, Terraform Cloud will automatically trigger a plan in any workspace connected to that repository. This plan can be reviewed for safety and accuracy in the Terraform UI, then it can be applied to provision the specified infrastructure.

<img src="https://www.terraform.io/assets/images/terraform-overview/cli-howitworks-2x-0b1a3eb0.png" />



## INTEGRATING GITHUB JENKINS AWS WITH TERRAFORM



<img src="https://www.terraform.io/assets/images/terraform-overview/cli-howitworks-2x-0b1a3eb0.png" />
