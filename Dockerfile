# Sử dụng image Java và Tomcat
FROM tomcat:10.0.2-jdk17

# Xóa webapps mặc định
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy file .war vào Tomcat
COPY target/*.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080
EXPOSE 8080

# Mặc định Tomcat sẽ start
