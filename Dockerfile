# Use official Node.js runtime
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install --only=production

# Copy source code
COPY . .

# Create a non-root user (security best practice)
RUN addgroup -g 1001 -S nodejs
RUN adduser -S nodejs -u 1001
USER nodejs

# Expose port (Render uses PORT environment variable)
EXPOSE 3000

# Use the PORT environment variable
ENV PORT=3000

# Start the application
CMD ["node", "server.js"]