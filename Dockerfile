FROM ubuntu:latest
RUN apt install apache2 && systemctl start apache2

