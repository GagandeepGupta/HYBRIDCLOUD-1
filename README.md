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



### TERRAFORM COMMANDS:
     
 1. The `terraform init` command is used to initialize a working directory containing Terraform configuration files. This is the first        command that should be run after writing a new Terraform configuration or cloning an existing one from version control. It is safe       to run this command multiple times. 
 2. The `terraform plan`command is used to create an execution plan. Terraform performs a refresh, unless explicitly disabled, and then     determines what actions are necessary to achieve the desired state specified in the configuration files.
   
 3. The `terraform apply` command is used to apply the changes required to reach the desired state of the configuration, or the pre-          determined set of actions generated by a `terraform plan` execution plan.
  
 4. The `terraform destroy` command is used to destroy the Terraform-managed infrastructure.
  
 5. The `terraform validate` command validates the configuration files in a directory, referring only to the configuration and not            accessing any remote services such as remote state, provider APIs, etc.
 
 6. The `terraform taint` command manually marks a Terraform-managed resource as tainted, forcing it to be destroyed and recreated on       the next apply.
  
 
 
 NOTE: If `-auto-approve` is set for apply and destroy , then the confirmation will not be shown.
 
 
I have used Windows as the slave but docker would be the efficient slave as it is dynamic and faster .
So some commands of Windows which i have used  are as under:

       
       
      
   |   COMMAND    |       DESCRIPTION                |
   | ------------ | --------------------------       | 
   | cd <path>    |    to change the directory       |
   | %variable%   |    to print the value of variable|
   |  rmdir /Q /S <path/to/dir>|    to forcefully remove the non-empty directory|
   |  echo <something> |   to print anything         |
   |   >              |       output redirection operator |

              
       
       
## TASK DESCRIPTION:

  #### 1. Create the key and security group which allow the port 80.
  #### 2. Launch EC2 instance.
  
  
  In this Ec2 instance use the key and security group which we have created in step 1.
  Launch one Volume (EBS) and mount that volume into /var/www/html
  
  
   
   [TERRAFORM CODE](https://github.com/raghav1674/HYBRIDCLOUD-1/blob/master/test.tf "creating vpc ,sg,ebs,mount,instance")
  
  
   

   #### 3. Developer have uploded the code into github repo also the repo has some images.
   #### 4.   Copy the github repo code into /var/www/html
   #### 5.   Create S3 bucket, and copy/deploy the images from github repo into the s3 bucket and change the permission to public 
   #### 6.   Create a Cloudfront using s3 bucket(which contains images) and use the Cloudfront URL to update in code in /var/www/html
   #### 7.   Create snapshot of ebs
   
   
  [PYTHON SCRIPT](https://github.com/raghav1674/HYBRIDCLOUD-1/blob/master/main_file.py "detecting the webpage and creatng index.tf")
  
  [TERRAFORM CODE](https://github.com/raghav1674/HYBRIDCLOUD-1/blob/master/s3.tf "S3 and cloudfront")
  
  [PYTHON SCRIPT](https://github.com/raghav1674/HYBRIDCLOUD-1/blob/master/change.py "changing image_url dynamically")
   
  [TERRAFORM CODE](https://github.com/raghav1674/HYBRIDCLOUD-1/blob/master/index.tf)
   
 
 #### 8. Those who are familiar with jenkins or are in devops AL have to integrate jenkins in this task wherever you feel can be integrated
          
   <img src="https://github.com/raghav1674/HYBRIDCLOUD-1/blob/master/images/jenkins-static-slave.PNG" />
          
                                        WINDOWS AS THE JENKINS SLAVE 
                                        
   
   
   <img src="https://github.com/raghav1674/HYBRIDCLOUD-1/blob/master/images/git-commit-realone.PNG" />                                    
 
     
                                     GIT POST COMMIT HOOK - REMOTE TRIGGER FOR JENKINS INITIAL JOB 
                                     
  
  <img src="https://github.com/raghav1674/HYBRIDCLOUD-1/blob/master/images/validate-which-build.PNG" />
  
    
     FIRST  JOB WHICH IS TO BE TRIGGERED BY POST COMMIT HOOK AND IS EXCUTED WHERE JENKINS SERVER IS RUNNING (in my case RHEL8)
                                             
                                             
                                             
   <img src="https://github.com/raghav1674/HYBRIDCLOUD-1/blob/master/images/initail_pull_job-2.PNG" />
   
                                              GITHUB FIRST PULL - TERRAFORM INIT AND APPLY
                                              
                                              
                                              
   <img src="https://github.com/raghav1674/HYBRIDCLOUD-1/blob/master/images/s3_update_job-2.PNG" />
   
                                              JOB FOR UPDATING THE IMAGES AND CODE
                   
                                     


### INITIAL SITE


<img src="https://github.com/raghav1674/HYBRIDCLOUD-1/blob/master/images/site-1.PNG" />

















### AFTER SECOND COMMIT


<img src="https://github.com/raghav1674/HYBRIDCLOUD-1/blob/master/images/site-2.PNG" />




