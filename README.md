### dmytro-vyshniakov-devops-task
GL DevOps ProCamp entry task

# Metrics collection script  

## Overview

Python script which prints basic information about an operation system to console.  
Docker container print all the information to logs every 5 second by default.

## Installation 

*$git clone https://github.com/dvysh/dmytro-vyshniakov-devops-task.git*  
*$cd dmytro-vyshniakov-devops-task*  

### Running the python script by itself

**$./metrics <cpu|mem|proc|all> **  
- 'cpu' - CPU information  
- 'mem' - Memory and Swap information  
- 'proc' - Information about system's processes  
- 'all' - all above, one by one  

## Running the script into Docker container
### Basic 

Compile the image and run a container:  
*$docker build -t metrics .*  
*$docker run --rm -d metrics*

Then you can see the basic system information in the container logs refreshed every 5 sec:  
**$docker logs -f <CONTAINER_ID>**

### Advanced settings

You can define updating time and type of the system information by defining variables:  
- **'TIME'** - updating time, seconds (default 5 sec)  
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
