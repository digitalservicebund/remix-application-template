# Download and install the dependenciees for building the app
FROM node:20.9.0 as build-dependencies

WORKDIR /src
COPY package*.json ./
RUN npm ci

# Download and install the dependencies for running the app
FROM node:20.9.0 as production-dependencies

ENV NODE_ENV production
WORKDIR /src
COPY package*.json ./
RUN npm ci

# Build the app
FROM node:20.9.0 as build

ARG COMMIT_SHA
ENV APP_VERSION=$COMMIT_SHA

# Create app directory
WORKDIR /src

# Copy the build dependencies
COPY --from=build-dependencies /src/node_modules /src/node_modules

# Required files are whitelisted in dockerignore
COPY . ./
RUN npm run build

# Final image that runs the app
FROM node:20.9.0-alpine3.18

USER node
ENV NODE_ENV=production
ARG COMMIT_SHA
ENV APP_VERSION=$COMMIT_SHA

WORKDIR /home/node/src
# Move only the files to the final image that are really needed
COPY --chown=node:node package*.json LICENSE SECURITY.md security.txt ./
COPY --chown=node:node --from=production-dependencies /src/node_modules/ ./node_modules/
COPY --chown=node:node --from=build /src/build/ ./build/
COPY --chown=node:node --from=build /src/public/ ./public/

EXPOSE 3000
CMD ["npm", "run", "start"]
