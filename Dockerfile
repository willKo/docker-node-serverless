FROM node:6.10.3-wheezy
RUN npm -v
RUN apt-get update

RUN npm install -g serverless@1.16.1
RUN serverless -v
RUN npm install serverless-dynamodb-local --save-dev
RUN npm install serverless-offline --save-dev

RUN  export LDFLAGS=-Wl,-rpath=/var/task/
RUN apt-get install libcairo2-dev libjpeg8-dev libpango1.0-dev libgif-dev build-essential g++ -y
RUN export PKG_CONFIG_PATH='/usr/local/lib/pkgconfig'  
RUN export LD_LIBRARY_PATH='/usr/local/lib':$LD_LIBRARY_PATH  

RUN npm install -g canvas
RUN npm install -g node-gyp 
RUN npm install -g fabric@1.7.14
RUN cd node_modules/canvas
RUN node-gyp rebuild
RUN cd ../../ 
RUN mkdir pkg 
RUN cp -L nodemodules/canvas/lib/*.so.* ./pkg

