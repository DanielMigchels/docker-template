# Alpine is a very light 
FROM node:10-alpine AS base
WORKDIR /usr/src/dtest
COPY package*.json ./

# Builder image used only for compiling Typescript files
FROM base as builder
RUN npm ci
COPY . .
RUN npm run compile

# Lean production image that just contains the dist directory and runtime dependencies
FROM base as prod
RUN npm ci --only=production
COPY --from=builder /usr/src/dtest/dist/* /usr/src/dtest
ENV NODE_ENV=production
CMD ["npm", "start"]