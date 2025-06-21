FROM nginx:stable-alpine

# Remove default config
RUN rm /etc/nginx/conf.d/default.conf

# Copy custom Nginx config
COPY nginx.conf /etc/nginx/conf.d

# Copy built React app
COPY build /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

