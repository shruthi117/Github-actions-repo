# Use official Node.js image as base
FROM node:18  # Use the required Node.js version

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json first (better caching)
COPY package.json package-lock.json ./

# Install dependencies
RUN npm ci --production  # Use "npm install" if no package-lock.json

# Copy the rest of the application code
COPY . .

# Expose the application port
EXPOSE 3000

# Start the application
CMD ["node", "app.js"]

