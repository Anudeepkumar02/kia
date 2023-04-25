FROM tomcat:9
MAINTAINER Anudeekumar@gmail.com
COPY target/*war /usr/local/tomcat/webapps/
CMD ['sleep']
