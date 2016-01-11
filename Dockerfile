FROM ubuntu:14.04

MAINTAINER Arlindo Santos <sarlindo@hotmail.com>

RUN apt-get install wget curl unzip -y

RUN curl -sL https://deb.nodesource.com/setup | sudo bash -

RUN apt-get install nodejs -y

RUN apt-get update

RUN wget https://github.com/node-red/node-red/releases/download/0.12.4/node-red-0.12.4.zip

RUN unzip node-red-0.12.4.zip -d /opt

WORKDIR /opt/node-red-0.12.4

RUN npm install --production

COPY app/flows/rancher/settings.js /root/.node-red/
COPY app/flows/rancher/rancher-consul-flow.json /root/.node-red/

COPY ./entrypoint.sh /root/.node-red/
RUN chmod +x /root/.node-red/entrypoint.sh

EXPOSE 1880
ENTRYPOINT ["/root/.node-red/entrypoint.sh"]

#ENTRYPOINT ["node"]
#CMD ["red.js"]
