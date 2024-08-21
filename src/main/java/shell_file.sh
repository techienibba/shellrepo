!#/bin/bash

#Info:This script is used to list the resources present in the cloud provider utilized in the enterprise and project
#Author:Javed Akram
#Version:1.0.0
#Usage:<Cloud providername> <region> <resource>
#example: For sake of brevity we will consider aws as the cloud provider -> aws ap-south-1 ec2
#Resources that are applicable to be queries in aws -> ec2,s3,vpc,cloudformation,cloudfront,route-53,ebs,elb,iam,dynamodb,lambda etc
#Comment to ensure coherence beween local and remote master branch
#Vallidation to ensure only two arguments are provided
if[$#-ne 2]; then

echo "usage:$0 <region> <resource>"
echo "example:./shell_file.sh aws ap-south1 ec2"

exit 1
fi

#Validation to ensure aws is installed in the system

if[!command -v aws &> /dev/null]; then
echo "Please install aws in system"
exit 1
fi

#Validation to ensure that awscli is installed and configured

if[!-d ~/.aws]; then
echo "Please configure awscli to interact with aws apis"
fi

#Code logic execution to list the details according to the resource queried,granted the region will be a constant in every query
#use switch case instead of if-else as its much more efficiant and causes lesser internal complexities compared to if-else

case $2 in
ec2)
   aws $1 ec2 describe-instances 
;;
 
s3)
   aws $1 s2 list-buckets
;;
dynamodb)
   aws $1 dynamobd list-instances
;;
vpc)
   aws $1 vpc describe-vpc
;;
resource)
   aws $1 resource <code to retrieve query accoring to code mentioned specific to that resource mentioned inthe resective cloud provider's config document>
;;
esac
         
     
   
