# ==== CONFIGURE =====
# Use a Node 16 base image
FROM node:16-alpine 
# Set the working directory to /app inside the container
WORKDIR /app
# Change the owner of the working directory to a non-root user
RUN addgroup -S nodejs && adduser -S nodejs -G nodejs
RUN chown -R nodejs:nodejs /app
RUN rm -rf /root/.npm /root/.config && \
  npm cache clear --force
# Set npm cache directory to /tmp/.npm
ENV npm_config_cache=/tmp/.npm

# Copy app files
COPY . .
# ==== BUILD =====
# Install dependencies (npm ci makes sure the exact versions in the lockfile gets installed)
RUN npm install
#RUN npm install --save-dev @babel/preset-react 
# Build the app
RUN npm run build
# ==== RUN =======
# Set the env to "production"
ENV NODE_ENV production
# Expose the port on which the app will be running (3000 is the default that `serve` uses)
EXPOSE 3000
# Start the app
CMD ["npm", "start"]
#CMD [ "npx", "serve", "build" ]
# github actions v3
