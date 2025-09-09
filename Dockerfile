# Use the official Flutter image
FROM ghcr.io/cirruslabs/flutter:3.16.0

# Set working directory
WORKDIR /app

# Copy pubspec files
COPY pubspec.yaml pubspec.lock ./

# Get dependencies
RUN flutter pub get

# Copy source code
COPY . .

# Build the web app
RUN flutter build web --release

# Use nginx to serve the built app
FROM nginx:alpine
COPY --from=0 /app/build/web /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
