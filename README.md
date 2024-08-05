# Cloud-1

This project aims to deploy a web application consisting of several services (WordPress, phpMyAdmin, a database, and Nginx) on multiple remote servers using Ansible and Docker.

## Prerequisites

-   Docker and Docker Compose installed on the deployment machine
-   Docker Compose installed on the deployment machine
-   SSH key authorized for connection to the remote servers

## Installation

```
    git clone https://github.com/jbettini/Cloud-1
    cd Cloud-1
```

## Project Structure

-   Dockerfile: Docker container configured with all prerequisites (Ansible, etc.)
-   .ssh: Directory containing the authorized SSH key and .gitconfig file
-   startup.sh: Container entry script that generates a random password and username for phpMyAdmin
-   collect_vars.sh: Script that collects necessary variables for the Jinja templates
-   playbook.yml: Ansible playbook for deploying the web application

## Deployment Instructions
### Prepare the Docker Container

Build the Docker container:

-   Place the .ssh directory in your project directory. This directory should contain:
    -   Your authorized SSH key (id_rsa)
    -   Your Git configuration file (.gitconfig). (Not necessary if you don't want to push from the master node)

### Launch the Docker Container
Launch the Docker container using Docker Compose:
```
    docker compose up --build
    docker compose run --rm cloud1
```

## Collect Variables
Run the collect_vars.sh script to collect the necessary variables:
```
    bash collect_vars.sh
```
The script will prompt for the following information:
-   The number of VPS (between 1 and 5)
-   The IP address authorized to access phpMyAdmin
-   The IP addresses of the VPS
-   The domain names pointing to your VPS

## Deploy the Web Application
Once the variables are collected, run the Ansible playbook:
```
    ansible-playbook playbook.yml
```
The playbook will perform the following tasks:
-   Install Docker and its plugins on the remote servers
-   Create the necessary files and directories for launching the web application using Jinja templates
-   Launch the application in HTTP to pass the Let's Encrypt challenge and generate an SSL certificate
-   Relaunch the application with HTTPS configuration

## Additional Information

-   The randomly generated phpMyAdmin credentials will be displayed upon container startup or available in the /tmp/check.lock file.
-   Ensure the IP addresses and domain names provided are correct to avoid errors during deployment.
-   A clean.sh script is available to delete all containers created by docker Be sure you want to run this script as it will remove all Docker containers and volumes without warning. Use with caution.