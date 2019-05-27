# Pull base image
From tomcat:8-jre8
# Maintainer
MAINTAINER "valaxytech@gmail.com"

# Copy war file on to container
COPY ./webapps.war /opt/apache-tomcat-7.0.94/webapps
