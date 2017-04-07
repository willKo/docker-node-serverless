FROM node:latest
RUN npm -v
RUN npm install -g serverless
RUN serverless -v
RUN npm install serverless-dynamodb-local --save-dev
RUN npm install serverless-offline --save-dev
