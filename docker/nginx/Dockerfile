FROM nginx

#COPY default.conf /etc/nginx/conf.d/default.conf
#RUN rm -rf /etc/nginx/conf.d/default.conf && \
#    echo '
#    upstream php {
#        server phpfpm:9000;
#    }
#
#    server {
#        listen 80 default_server;
#        listen [::]:80 default_server;
#
#    #        server_name upsidedowntext.online www.upsidedowntext.online;
#
#    #    root /var/www/upsidedowntext.online/public;
#
#        index index.php index.html;
#
#        location / {
#            try_files $uri $uri/ /index.php?$query_string;
#        }
#
#        location ~ \.php$ {
#            include fastcgi.conf;
#            fastcgi_intercept_errors on;
#            fastcgi_pass php;
#        }
#    }' > /etc/nginx/conf.d/default.conf

#RUN rm -rf /etc/nginx/conf.d/default.conf
RUN echo "upstream php {                  server phpfpm:9000;              }              server {                  listen 80 default_server;                  listen [::]:80 default_server;              index index.php index.html;                  location / {                      try_files $uri $uri/ /index.php?$query_string;                  }                  location ~ \.php$ {                      include fastcgi.conf;                      fastcgi_intercept_errors on;                      fastcgi_pass php;                  }              }" > /etc/nginx/conf.d/default.conf
RUN chmod +x /etc/nginx/conf.d/default.conf
EXPOSE 80