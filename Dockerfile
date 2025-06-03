# Stage 1: Build với Maven
FROM maven:3.9.6-eclipse-temurin-17 AS builder

WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Stage 2: Chạy với Tomcat ổn định hơn
FROM tomcat:10.0.27-jdk17-openjdk

# Xóa apps mặc định và cấu hình
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy file WAR vào Tomcat
COPY --from=builder /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

# Cấu hình thời gian khởi động Tomcat
ENV CATALINA_OPTS="-Djava.security.egd=file:/dev/./urandom -Dorg.apache.catalina.startup.ContextConfig.jarsToSkip=* -Dorg.apache.catalina.startup.TldConfig.jarsToSkip=* -XX:+UseContainerSupport -XX:MaxRAMPercentage=75.0 -Dfile.encoding=UTF-8"

# Port ứng dụng sẽ chạy (Render sẽ ánh xạ port 10000 vào 8080)
EXPOSE 8080

# Command khởi động rõ ràng
CMD ["catalina.sh", "run"]