FROM node:latest
RUN npm -v
RUN npm install -g serverless
RUN serverless -v
