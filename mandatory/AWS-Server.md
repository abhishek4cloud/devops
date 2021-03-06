#1 Initially Login to AWS Console 

#2 Select service EC2 under compute section

#3 Now proceed to Launch Instance

#4 Select AWS marketplace and search for centos

#5 Select Centos7 & chose instance type as t2.micro 

#6 Configure instance details accordingly

#7 Add storage & tags

#8 Configure security group, identify and add the port numbers as per the need
   
   I have configured the server to use SSH with tcp protocol and port number 22
   also added  port numbers 80(NGINX-with custom TCP and source anywhere since we want the application to be accessible publicly)
   also add Custom ICMP-IPv4 protocol as Echo request to ping the server.

#9 Now download the key and save to access the server via SSH 

#10 Now once you are logged inside the server perform the following commands     
       
	sudo yum update -y
        sudo yum install epel-release -y
  	sudo yum install -y nginx
  check the status by sudo systemctl status nginx 
  enable the service at startup by sudo systemctl enable nginx

	now create a file version.txt with content 1.0.6 inside the document root of nginx /usr/share/nginx/html/

#11 now restart the nginx service 
    
	sudo systemctl restart nginx

#12 we can check whether the nginx is serving our page or not by accessing the public IP of the server
   	
	$public-ip/version.txt
