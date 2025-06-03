# Stage 1: Build Maven project
FROM maven:3.9.6-eclipse-temurin-17 AS builder

WORKDIR /app

# Copy toàn bộ project vào container
COPY . .

# Build file WAR
RUN mvn clean package -DskipTests

# Stage 2: Run on Tomcat
FROM tomcat:10.1.0-M6-jdk17

# Xóa app mặc định
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy file .war từ Maven build vào Tomcat
COPY --from=builder /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

# Mở port
EXPOSE 8080

# Tomcat sẽ tự start
