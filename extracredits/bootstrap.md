#1 Inorder to boot strap the server from Ansible we need to setup another server designated as master

#2 Install the tool  Ansible on master

#3 Install Ansible 
 
	sudo yum install -y epel-release
	sudo yum install -y ansible

#4 Create ssh key in master and copy the public key to our test server

#5 Sort out all the port numbers before 

	I have assumed the port numbers 8080(nginx1), 8085(nginx2), 800(loadbalancer), 22(SSH Ansible Communication)
	
#6 Write a playbook for Installing the tools & dependencies
 
	Playbook included

#7 Once the containers are up and running we can build a docker container with nginx as load balancer
	
		upstream my-app {
    			server {host-ip}:8080;
    			server {host-ip}:8085;
		}

			server {
    			location / {
        		proxy_pass http://my-app;
    		}
	}

#8 The process to obtain ssl certificate from lets's encrypy can be found at 

	https://certbot.eff.org/lets-encrypt/centosrhel7-nginx

#9 In case the certificate and key are provided we can uncomment the configuration accordingly at /etc/nginx/nginx.conf

	Add the following lines below  listen [ : : ]:80 default_server; 
	listen 443 ssl http2 default_server; 
	listen [ : : ]:443 ssl  http2 default_server; 
	server_name {container-host-ip};
	 uncomment the ssl_certificate and ssl_certificate_key and change the path.

#10 We can use the script provided in mandatory to check whether the server is up and serving the version number 


