FROM nginx:1.25.3
# explicit tag version is more secure than using "latest"

COPY ./index.html /usr/share/nginx/html/index.html

