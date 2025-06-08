FROM node:22-alpine

# Install git to clone the repository
RUN apk add --no-cache git

# Clone the repo
RUN git clone https://github.com/tonur/linkedin-to-json-resume.git /app
WORKDIR /app

# Install deps and build the project
RUN npm install
RUN npm run build

# Set entrypoint to run the CLI
ENTRYPOINT ["npm", "run", "cli"]
CMD ["--help"]