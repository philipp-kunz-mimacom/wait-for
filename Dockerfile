FROM node:17-alpine@sha256:e64dc950217610c86f29aef803b123e1b6a4a372d6fa4bcf71f9ddcbd39eba5c

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
