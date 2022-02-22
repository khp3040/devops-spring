FROM openjdk:8
COPY ./target/devops-springboot-0.1.5-SNAPSHOT.jar devops-springboot-0.1.5-SNAPSHOT.jar
CMD ["java","-jar","devops-springboot-0.1.5-SNAPSHOT.jar"]