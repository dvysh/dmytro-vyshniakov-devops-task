# dmytro-vyshniakov-devops-task
GL DevOps ProCamp entry task

# Metrics. Overview

Python script which prints basic information about your OS to console.  
Docker container print all the information to logs every 5 second by default.

## Installation 
### Basic 

*$git clone https://github.com/dvysh/dmytro-vyshniakov-devops-task.git*  
*$cd dmytro-vyshniakov-devops-task*  
*$docker build -t metrics .*  
*$docker run --rm -d metrics*

Then you can see the basic system information in the container logs refreshed every 5 sec:  
**$docker logs <CONTAINER_ID> -f**

### Advanced settings

You can define updating time and type of the system information by adding variables:  
- **'TIME'** - the informations updating time, seconds (defailt 5 sec)  
- **'MTR'** -  listed metrics:   
   'cpu' - CPU information  
   'mem' - Memory and Swap information  
   'proc' - Information about system's processes  
   'all' - all above, one by one  
 
 For example:  
 **$docker run --rm -e TIME=10 -e MTR=cpu -d metrics**  
The container will print CPU information every 10 seconds

### Processes on a host machine
The docker image can show an information about processes on a host machine if runs with additional options.
It needs to mount volumes during the contaner launching

**$docker run --rm -v /proc:/proc-host -v /etc/passwd:/etc/passwd -e MTR=proc -d metrics**  
This command makes a container print information about processes on a host machine to its logs  
