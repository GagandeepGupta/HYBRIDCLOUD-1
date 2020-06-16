import sys
import os
from fileinput import FileInput
def get_var_value(filename="value_counts.txt"):
    with open(filename, "r+") as f:
        f.seek(0)
        val = int(f.read()) + 1
        f.seek(0)
    
        f.write(str(val))
        return val
url=sys.argv[1]
content_type=os.path.basename(url)
content_type=os.path.splitext(content_type)[1]
#job_name=sys.argv[]
#initial_path=os.path.join(r"C:\Users\Raghav Gupta\Desktop\FUTURE READY KNOWLEDGE\Cloud\TERRAFORM\teraws\tera-test\newone\workspace" ,job_name)
#files=os.listdir(r"{0}".format(initial_path))
#print(files)

count=get_var_value()
print(count)
if count==1:
    web_initial_path=r"C:\Users\Raghav Gupta\Desktop\FUTURE READY KNOWLEDGE\Cloud\TERRAFORM\teraws\tera-test\newone\workspace\github_initial_pull"
    web_files=os.listdir(r"C:\Users\Raghav Gupta\Desktop\FUTURE READY KNOWLEDGE\Cloud\TERRAFORM\teraws\tera-test\newone\workspace\github_initial_pull")

else:
    web_initial_path=r"C:\Users\Raghav Gupta\Desktop\FUTURE READY KNOWLEDGE\Cloud\TERRAFORM\teraws\tera-test\newone\workspace\s3-bucket"
    web_files=os.listdir(r"C:\Users\Raghav Gupta\Desktop\FUTURE READY KNOWLEDGE\Cloud\TERRAFORM\teraws\tera-test\newone\workspace\s3-bucket") 

web_need=[ file for  file  in web_files if (os.path.splitext(file)[1].lower() in [".html",".js",".php"])]
web_actual_path=os.path.join(web_initial_path,web_need[0])
web_li=f'source="{web_actual_path}" '

web_li=web_li.replace("\\","/")
print(web_li)

with FileInput(web_actual_path,inplace=True) as ip:
    for line in ip:
        if "<img src" in line or content_type in line :
            str=f'<img src ="{url}" class="img-fluid" alt="Responsive image">  '
            print(line.replace(line,str))
        else:
             print(line.strip())

web=web_need[0]
web=os.path.splitext(web)[1]
target_actual_path=os.path.join("\\var\www\html",web_need[0])
print(target_actual_path)
web_li_target=f'destination="{target_actual_path}" '
web_li_target=web_li_target.replace("\\","/")
print(web_li_target)

st=f'''resource "null_resource" "site"[

connection [
    type     = "ssh"
    user     = "ec2-user"
    private_key=tls_private_key.my_key.private_key_pem
    host     = aws_instance.my_instance.public_ip
  ]

provisioner "file"[

{web_li}
{web_li_target}
]
]
'''

st=st.replace("[","{")
st=st.replace("]","}")
print(st)

file=os.path.splitext(web_need[0])[0]+".tf"
with open(file,"w") as fp:
    fp.write(st)



#os.system("terraform taint null_resource.site")
#os.system("terraform apply -auto-approve")

   


