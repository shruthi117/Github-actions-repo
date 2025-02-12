# Use official Node.js image
FROM node:18

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json before copying other files
COPY package.json package-lock.json ./

# Install dependencies (use npm ci for clean installs)
RUN npm i 

# Copy the entire application (after installing dependencies)
COPY . .

# Expose the application port
EXPOSE 3000

# Start the application
CMD ["node", "app.js"]
