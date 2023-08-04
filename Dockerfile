FROM centos:7

RUN /bin/bash yum install httpd -y

COPY index.html /var/www/html/index.html

EXPOSE 80

CMD apachectl -D FOREGROUND
