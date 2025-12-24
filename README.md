# Capstone-Project-2
This is Capstone-Project-2 which include end to end deployment of the monolithic app

Steps:  

1- Create a ec2 instance name it as you want (JenkinsServer). Install Java and Jenkins in it.  
2- Created two ec2 instance named "Test Server" and "K8" using terraform.  
3- Configure Jenkis server and add two nodes "Test Server" as  "testserver" label and "K8" as "KubeCluster" label.  
   - Test server is for build, test and deploy image on dockerhub.  
   - K8 server is where custer get created and app is deployed in prod.
4- Verify nodes are working through Jenkins and are active.

<img width="1095" height="222" alt="image" src="https://github.com/user-attachments/assets/a98947a5-5884-4486-80fb-f5b32de51885" />  

  
5-> In jenkins server ec2 install ansible and configure it. Also create a inventory.ini.  
    Note: add below in /etc/ansible/ansible.cfg so that ansible can connect to oher nodes silently for firsttime as well:  
          [defaults]  
          host_key_checking = False  

6-> So we have 3 machines ready for now:  
    - jenkins server : install java, jenkins, ansible, aws cli, terraform
    - test server : install java, docker  
    - K8 : install java, aws cli, eksctl, kubectl  

7-> Create a jenkins pipeline for build, test and push docker image. Used Pipeline and Jenkisfile for that:  
<img width="1011" height="521" alt="image" src="https://github.com/user-attachments/assets/dceb82fb-a33d-4e9c-81e9-9cdaed2c9103" />

8-> Create another pipeline to deploy app to kubernetes cluster. Used Pipeline and Jenkinsfile1 for that
