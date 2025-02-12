# Use official Node.js image as base
FROM node:14

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json first
COPY package*.json ./

# Install dependencies explicitly
RUN npm ci --only=production  # ✅ Ensures clean install of exact dependencies

# Copy the rest of the application code
COPY . .

# Expose the port
EXPOSE 3000

# Start the application
CMD ["node", "app.js"]
