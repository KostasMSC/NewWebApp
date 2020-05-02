FROM tomcat:9.0.1-jre8-alpine

COPY target/NewWebApp.war /usr/local/tomcat/webapps/NewWebApp.war

CMD ["catalina.sh", "run"]
