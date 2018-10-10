#
# Dockerfile for RSA and GOST selfsigned certificates on NGINX
#

FROM debian:jessie
MAINTAINER LiquidPredator <liquidpredator@gmail.com>
	
RUN 	apt-get update										&& \
	apt-get install -y wget openssl								&& \
	echo "deb http://nginx.org/packages/debian/ jessie nginx" >> /etc/apt/sources.list	&& \
	echo "deb-src http://nginx.org/packages/debian/ jessie nginx" >> /etc/apt/sources.list	&& \
	cd ~											&& \
	wget http://nginx.org/keys/nginx_signing.key						&& \
	apt-key add nginx_signing.key								&& \
	rm nginx_signing.key									&& \
	apt-get update										&& \
	apt-get install -y nginx								&& \
	apt clean && rm -rf /var/lib/apt/lists/*    						&& \
	service nginx stop

RUN	touch ~/.rnd			&& \
	mkdir -p /etc/nginx/certs/rsa	&& \
	mkdir -p /etc/nginx/certs/gost
	
COPY ./confs/nginx.conf /etc/nginx/nginx.conf
COPY ./confs/openssl.cnf /etc/ssl/openssl.cnf
COPY ./confs/host.conf /etc/nginx/hosts/host.conf

COPY ./certs/gost.crt /etc/nginx/certs/gost/example.com.crt
COPY ./certs/gost.key /etc/nginx/certs/gost/example.com.key
COPY ./certs/rsa.crt /etc/nginx/certs/rsa/example.com.crt
COPY ./certs/rsa.key /etc/nginx/certs/rsa/example.com.key

COPY host /usr/share/nginx/html/

EXPOSE 80
EXPOSE 443

CMD ["nginx","-g","daemon off;"]
