FROM tomcat:latest 
MAINTAINER "Sriram Mageswaran K"

COPY mysql.jar /usr/local/tomcat/lib/mysql.jar 

EXPOSE 8080


