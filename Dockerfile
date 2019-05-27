FROM centos:latest
MAINTAINER Dharma (dharamg36@gmail.com)

#RUN echo "Asia/Shanghai" > /etc/timezone

# now add java and tomcat support in the container
ADD jdk-7u80-linux-x64.tar.gz  /usr/local/
ADD apache-tomcat-7.0.94.tar.gz /usr/local/
COPY ./webapp.war /usr/local/tomcat/webapp

# configuration of java and tomcat ENV
ENV JAVA_HOME /usr/local/jdk1.7.0_80
ENV CLASSPATH $JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
ENV CATALINA_HOME /usr/local/apache-tomcat-7.0.94
ENV PATH $PATH:$JAVA_HOME/bin:$CATALINA_HOME/lib:$CATALINA_HOME/bin

# container listener port
EXPOSE 8080
# startup web application services by self
CMD /usr/local/apache-tomcat-7.0.94/bin/catalina.sh run
