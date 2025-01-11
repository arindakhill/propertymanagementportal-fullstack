# Stage 1: Build the application
FROM maven:3.8.4-openjdk-17 AS build
WORKDIR /app

# Copy the source code and pom.xml file into the image
COPY src ./src
COPY pom.xml .

# Build the application
#RUN mvn clean package
RUN mvn clean install -DskipTests



# Use the official OpenJDK 17 image as the base image
FROM openjdk:17-jdk
#FROM openjdk:17-jdk-slim-buster
#FROM openjdk:17-alpine


#COPY wait-for-it.sh /wait-for-it.sh
#RUN chmod +x /wait-for-it.sh

# Download wait-for-it.sh script
ADD https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh /usr/wait-for-it.sh
RUN chmod +x /usr/wait-for-it.sh

# Set the working directory inside the container
WORKDIR /app

# Copy the application JAR file to the container
COPY --from=build /app/target/portal-0.0.1-SNAPSHOT.jar /app/my-application.jar

# Expose the port on which the application will run
EXPOSE 8080

# Set the entry point command to run the application
#CMD ["java", "-jar", "/app/my-application.jar"]
#CMD ["./wait-for-it.sh", "postgres:5432", "--", "java", "-jar", "/app/my-application.jar"]
#CMD ["/usr/wait-for-it.sh", "postgres:5432", "--timeout=30", "--", "java", "-jar", "/app/my-application.jar"]

# After the backend application has been set up
#COPY populate-db.sh /app/populate-db.sh
#RUN chmod +x /app/populate-db.sh
#CMD ["/app/populate-db.sh"]
#RUN apt-get update && apt-get install -y postgresql-client
#RUN apk add --no-cache postgresql-client
#RUN apk add --no-cache bash


#COPY ./src/main/resources/data.sql /usr/data.sql


#COPY start-backend.sh /app/start-backend.sh
#COPY populate-db.sh /usr/populate-db.sh
#COPY startup.sh /app/startup.sh

#RUN chmod +x /app/start-backend.sh
#RUN chmod +x /usr/populate-db.sh
#RUN chmod +x /app/startup.sh

#CMD ["/usr/wait-for-it.sh", "postgres:5432", "--timeout=30", "--", "java", "-jar", "/app/my-application.jar", "&", "/usr/populate-db.sh"]
CMD ["/usr/wait-for-it.sh", "postgres:5432", "--timeout=30", "--", "java", "-jar", "/app/my-application.jar"]


#CMD ["/app/startup.sh"]
