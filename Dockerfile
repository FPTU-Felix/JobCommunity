
# Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
# Click nbfs://nbhost/SystemFileSystem/Templates/Other/Dockerfile to edit this template

FROM alpine:latest

# Sử dụng image có sẵn của Maven và Java
FROM maven:3.9.9-eclipse-temurin-17

# Đặt thư mục làm việc trong container
WORKDIR /app

# Copy toàn bộ project vào container
COPY . .

# Biên dịch và đóng gói ứng dụng
RUN mvn clean package

# Chạy ứng dụng (nếu là ứng dụng Spring Boot hoặc Java Application)
CMD ["java", "-jar", "target/MyWebApp-1.0-SNAPSHOT.war"]


