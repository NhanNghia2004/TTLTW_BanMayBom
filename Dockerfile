# Bước 1: Dùng Maven để build WAR
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package

# Stage 2: Chạy với Tomcat ổn định hơn
FROM tomcat:10.1.5-jdk17

# Xóa ứng dụng mặc định
RUN rm -rf /usr/local/tomcat/webapps/*

# ✅ Copy WAR từ stage "build"
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
