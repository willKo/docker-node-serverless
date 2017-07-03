FROM node:6.10.3-wheezy
RUN npm -v
RUN apt-get update
RUN npm install -g serverless@1.16.1
RUN serverless -v
RUN npm install serverless-dynamodb-local --save-dev
RUN npm install serverless-offline --save-dev
RUN npm install fabric@1.7.14
RUN export LDFLAGS=-Wl,-rpath=/var/task/

RUN apt-get install libcairo2-dev libjpeg62  giflib-tools -y
RUN export PKG_CONFIG_PATH='/usr/local/lib/pkgconfig'  
RUN export LD_LIBRARY_PATH='/usr/local/lib':$LD_LIBRARY_PATH  


RUN curl -L http://sourceforge.net/projects/libpng/files/libpng15/1.5.27/libpng-1.5.27.tar.xz/download -o libpng.tar.xz
RUN tar -Jxf libpng.tar.xz && cd libpng-1.5.27/
RUN ./configure --prefix=/usr/local
RUN make 
RUN sudo make install  
RUN curl http://www.ijg.org/files/jpegsrc.v8d.tar.gz -o jpegsrc.tar.gz
RUN tar -zxf jpegsrc.tar.gz && cd jpeg-8d/
RUN ./configure --disable-dependency-tracking --prefix=/usr/local  
RUN make
RUN sudo make install
RUN curl https://www.cairographics.org/releases/pixman-0.28.2.tar.gz -o pixman.tar.gz  
RUN tar -zxf pixman.tar.gz && cd pixman-0.28.2/  
RUN ./configure --prefix=/usr/local   
RUN make 
RUN sudo make install  


RUN curl http://public.p-knowledge.co.jp/Savannah-nongnu-mirror//freetype/freetype-2.4.11.tar.gz -o freetype.tar.gz
RUN tar -zxf freetype.tar.gz && cd freetype-2.4.11/  

RUN make 
RUN sudo make install 

RUN curl https://cairographics.org/releases/cairo-1.12.14.tar.xz -o cairo.tar.xz  
RUN tar -xJf cairo.tar.xz && cd cairo-1.12.14/  
RUN ./configure --disable-dependency-tracking --without-x --prefix=/usr/local 
RUN make 
RUN sudo make install 

RUN npm install node-canvas
RUN cd node_modules/canvas
RUN node-gyp rebuild
RUN cd ../../
RUN npm install -g fabric@1.7.14

