FROM nginx:1.22.1

RUN  useradd --uid 1001 nginxuser
COPY default.conf /etc/nginx/conf.d/

COPY /app ./app
RUN touch /var/run/nginx.pid && \
    chown -R nginxuser:nginxuser /var/run/nginx.pid  && \
    chown -R nginxuser:nginxuser /app && \
    chown -R nginxuser:nginxuser /etc/nginx/conf.d && \
    chown -R nginxuser:nginxuser /var/cache/nginx && \
    chown -R nginxuser:nginxuser /var/log/nginx \ 
             && rm -rf /var/lib/apt/lists/*    


USER nginxuser
EXPOSE 8000
CMD ["nginx", "-g", "daemon off;"]


