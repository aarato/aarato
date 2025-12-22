# Build the Vite project
FROM node:20-alpine as builder

# Set the working directory
WORKDIR /app

# Copy everything except what's excluded in .dockerignore
COPY . .

# Install dependencies and build the project
RUN npm install
RUN npm run build

# Serve the content with Nginx
FROM nginx:alpine

# Copy the built files from the previous stage
COPY --from=builder /app/dist /usr/share/nginx/html

# Copy the entrypoint script
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

# Expose port 80
EXPOSE 80

# Use custom entrypoint that generates config.json
ENTRYPOINT ["/docker-entrypoint.sh"]

# Test this with
# docker build --load -t aarato .
# docker run -it --rm  -p 8080:80 aarato