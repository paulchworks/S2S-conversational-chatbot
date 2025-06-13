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

# Command to run the application
CMD ["node", "dist/server.js"]