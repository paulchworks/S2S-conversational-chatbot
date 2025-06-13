FROM node:18-slim

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy source code
COPY . .

# Build TypeScript code
RUN npm run build

# Expose the port the app runs on
EXPOSE 3000

# Set environment variables
ENV NODE_ENV=development
ENV DEBUG=*
ENV NODE_OPTIONS="--max-old-space-size=4096 --dns-result-order=ipv4first"
ENV AWS_NODEJS_CONNECTION_REUSE_ENABLED=1

# Install curl for network diagnostics
RUN apt-get update && apt-get install -y curl iputils-ping dnsutils && apt-get clean

# Command to run the application using npm start
CMD ["npm", "start"]