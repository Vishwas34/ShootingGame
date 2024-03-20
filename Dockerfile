FROM maven:3.8.3-openjdk-17 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17.0.1-jdk-slim
COPY  --from=build /target/java-shooter-game-project-master-0.0.1-SNAPSHOT.jar java-shooter-game-project-master.jar
EXPOSE 8081
ENTRYPOINT ["java","-jar","/java-shooter-game-project-master.jar"]