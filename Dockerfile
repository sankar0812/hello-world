From tomcat:9-jre9

# Maintainer
MAINTAINER "sankar0812"

# copy war file on to container
COPY ./webapp.war /usr/local/tomcat/webapps
