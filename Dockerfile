FROM node:16.12-alpine@sha256:4faa7d0ec8b49051ddf8336fa4bca7eb42a16855e29ea4a6fe3204482a0bc220

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
