FROM node:16-alpine@sha256:c2ed3b2b36b726980474f8bf80025ca3a1aeb90c76286953f9f4b9b1dc3001b0

# Install bash
RUN apk add --no-cache bash

# Create working directory
RUN mkdir -p /app
WORKDIR /app

# Install all Node dependencies
COPY package.json /app/
COPY package-lock.json /app/

RUN npm ci

# Copy source code
COPY . /app/

# Define default command
CMD npm test
