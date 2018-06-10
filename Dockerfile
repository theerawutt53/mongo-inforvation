FROM node:10

RUN apt-get update \
    && apt-get -qq --no-install-recommends install \        
      unzip \
      wget \
      git

RUN git clone https://github.com/theerawutt53/mongodb-rest.git \
    && cd mongodb-rest \
    && npm install            

RUN wget -q --content-disposition http://assertdb.nu.ac.th/mongodb-docker.zip \
    && unzip mongodb-docker.zip \
    && rm mongodb-docker.zip

RUN npm install -g forever



WORKDIR /mongodb-rest

CMD ["forever", "server.js"]
EXPOSE 8000