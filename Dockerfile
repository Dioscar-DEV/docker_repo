FROM n8nio/n8n:latest

USER root
RUN mkdir -p /home/node/.n8n/nodes \
 && chown -R node:node /home/node/.n8n

USER node
WORKDIR /home/node/.n8n/nodes

RUN npm install --save @rmichelena/n8n-nodes-redis-enhanced

WORKDIR /home/node
