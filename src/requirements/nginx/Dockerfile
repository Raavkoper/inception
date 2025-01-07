FROM debian:bullseye

EXPOSE 443

RUN		apt-get update
RUN		apt-get install -y nginx \
                openssl

COPY index.html /usr/share/nginx/html/index.html

COPY nginx.conf /etc/nginx/nginx.conf

RUN openssl req -x509 -nodes -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/CN=rkoper.42.fr"

CMD ["nginx", "-g", "daemon off;"]