FROM maven:3.6.3 AS MAVEN_TOOL_CHAIN
COPY pom.xml /tmp/
COPY src /tmp/src/
WORKDIR /tmp/
RUN mvn package

FROM tomcat:9.0.1-jre8-alpine

COPY --from=MAVEN_TOOL_CHAIN /tmp/target/NewWebApp.war /usr/local/tomcat/webapps/NewWebApp.war

CMD ["catalina.sh", "run"]
