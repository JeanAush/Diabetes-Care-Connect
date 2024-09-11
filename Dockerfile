# Stage 1: Build stage
FROM node:16-alpine3.16 AS build-stage

# Set the working directory for the build
WORKDIR /Diabetes-Care-Connect

# Copy package.json and package-lock.json to install dependencies
COPY package*.json ./

# Install all dependencies, including dev dependencies, to build the app
RUN npm install

# Copy the source code into the container
COPY . .

# Build the application
RUN node index.js & 
RUN node app.js & 


# Stage 2: Production stage (smaller final image)
FROM node:16-alpine3.16 AS production-stage

# Set the working directory for the final stage
WORKDIR /Diabetes-Care-Connect

# Copy only the production dependencies from the first stage
COPY --from=build-stage /package*.json ./
# RUN npm install --production


# Expose the ports
EXPOSE 6000
EXPOSE 8000

# Start the application
CMD ["npm","start"]
