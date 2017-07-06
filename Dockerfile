FROM node:6.10.3-wheezy
RUN npm -v
RUN apt-get update

RUN wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz
RUN unxz wkhtmltox-linux-amd64_0.12.0-03c001d.tar.xz
RUN tar -xvf wkhtmltox-linux-amd64_0.12.0-03c001d.tar
RUN cd /wkhtmltox/bin
RUN mv wkhtmltopdf  /usr/bin/wkhtmltopdf

RUN npm install -g node-wkhtmltopdf 
RUN npm install -g serverless@1.16.1
RUN serverless -v


RUN  export LDFLAGS=-Wl,-rpath=/var/task/
RUN apt-get install libcairo2-dev libjpeg8-dev libpango1.0-dev libgif-dev build-essential g++ -y
RUN export PKG_CONFIG_PATH='/usr/local/lib/pkgconfig'  
RUN export LD_LIBRARY_PATH='/usr/local/lib':$LD_LIBRARY_PATH  

RUN npm install -g canvas
RUN npm install -g node-gyp 
RUN npm install -g fabric@1.7.14
RUN ls
RUN find  . -name node-modules  > test.txt
RUN cat test.txt
RUN ls 
RUN cd ../
RUN ls usr/
RUN ls  node-modules/
RUN cd node_modules 
RUN ls
RUN cd ./canvas
RUN node-gyp rebuild
RUN cd ../../ 
RUN mkdir pkg 
RUN cp -L nodemodules/canvas/lib/*.so.* ./pkg
