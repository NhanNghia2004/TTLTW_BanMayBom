# Bước 1: Dùng Maven để build WAR
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package

# Stage 2: Chạy với Tomcat ổn định hơn
FROM tomcat:10.1.5-jdk17

# Xóa ứng dụng mặc định
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy file WAR vào thư mục webapps
COPY ./target/yourapp.war /usr/local/tomcat/webapps/ROOT.war

# Mở cổng 8080
EXPOSE 8080