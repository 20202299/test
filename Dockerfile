FROM bitnami/node:9 as builder
ENV NODE_ENV="production"

# Copy app's source code to the /app directory
COPY . /views

# The application's directory will be the working directory
WORKDIR /views

# Install Node.js dependencies defined in '/app/packages.json'
RUN npm install

FROM bitnami/node:9-prod
ENV NODE_ENV="production"
COPY --from=builder /views /views
WORKDIR /views
ENV PORT 3000
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
