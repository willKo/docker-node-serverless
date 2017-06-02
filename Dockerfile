FROM node:7.9.0
RUN npm -v
RUN npm install -g serverless@1.14
RUN serverless -v
RUN npm install serverless-dynamodb-local --save-dev
RUN npm install serverless-offline --save-dev
