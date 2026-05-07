# Import image node version 14
FROM node:14

# Add working directory with path /app
WORKDIR /app

# Copy source code local machine to image directory to /app
COPY . .

# Set environment for NODE_ENV & DB_HOST
ENV NODE_ENV=production DB_HOST=item-db

# Run npm install && npm run build in stage build image
RUN npm install --production --unsafe-perm && npm run build

# Set port 8080 for access 
EXPOSE 8080

# Add command npm start if image success build
CMD ["npm", "start"]