Useful

• Your site can restart automatically if the server is rebooted.
• In case of reboot all the data of the site are persisted (images, user accounts, articles, ...).


• It is possible to deploy your site on several servers in parallel.


• Public access to your server must be limited and secure (for example, it is not possible to connect directly to your database from the internet).




roles pour lancer en https uniquement + utiliser volumes

Installer docker





Fait :
------------------------------------------------
• The script must be able to function in an automated way with for only assumption an ubuntu 20.04 LTS like 
OS of the target instance running an SSH daemon and with Python installed.
• The services will be the different components of a WordPress to install by yourself. For example Phpmyadmin, MySQL, ...
• Your applications will run in separate containers that can communicate with each other (1 process = 1 container)
• You must have a docker-compose.yml.
• Your server should be able, when possible, to use TLS.
• You will need to make sure that, depending on the URL requested, your server redirects to the correct site.
• You will need to ensure that your SQL database works with WordPress and PHP-MyAdmin.
