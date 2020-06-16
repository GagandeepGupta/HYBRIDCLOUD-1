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



<img src="https://miro.medium.com/max/2400/0*VoKJItSlwsZXriPt" />






## TASK DESCRIPTION:

  #### 1. Create the key and security group which allow the port 80.
  ####     Launch EC2 instance.
  
  
     In this Ec2 instance use the key and security group which we have created in step 1.
     Launch one Volume (EBS) and mount that volume into /var/www/html
  
  
   [TERRAFORM CODE](https://github.com/raghav1674/HYBRIDCLOUD-1/blob/master/test.tf "creating vpc ,sg,ebs,mount,instance")
  
  
   

   #### 2. Developer have uploded the code into github repo also the repo has some images.
   ####     Copy the github repo code into /var/www/html
   ####     Create S3 bucket, and copy/deploy the images from github repo into the s3 bucket and change the permission to public 
   ####     Create a Cloudfront using s3 bucket(which contains images) and use the Cloudfront URL to update in code in /var/www/html
   ####     Create snapshot of ebs
   
   
  [PYTHON SCRIPT](https://github.com/raghav1674/HYBRIDCLOUD-1/blob/master/main_file.py "detecting the webpage and creatng index.tf")
  
  [TERRAFORM CODE](https://github.com/raghav1674/HYBRIDCLOUD-1/blob/master/s3.tf "S3 and cloudfront")
  
  [PYTHON SCRIPT](https://github.com/raghav1674/HYBRIDCLOUD-1/blob/master/change.py "changing image_url dynamically")
   
  [TERRAFORM CODE](https://github.com/raghav1674/HYBRIDCLOUD-1/blob/master/index.tf)
   
 
 #### 3. Those who are familiar with jenkins or are in devops AL have to integrate jenkins in this task wherever you feel can be integrated
          
          





