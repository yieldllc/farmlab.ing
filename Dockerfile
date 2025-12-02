# Build stage
FROM python:3.12-slim as builder

WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy source files
COPY mkdocs.yml .
COPY docs/ docs/

# Build the static site
RUN mkdocs build

# Production stage
FROM nginx:alpine

# Copy the built site to nginx
COPY --from=builder /app/site /usr/share/nginx/html

# Copy custom nginx config for SPA support
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
