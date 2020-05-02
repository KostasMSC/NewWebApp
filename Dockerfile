FROM tomcat:9.0.1-jre8-alpine

ADD target/NewWebApp.war /usr/local/tomcat/webapps/

CMD ["catalina.sh", "run"]