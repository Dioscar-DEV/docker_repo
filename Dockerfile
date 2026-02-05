FROM n8nio/n8n:latest

USER root

RUN mkdir -p /home/node/.n8n/nodes

WORKDIR /tmp
RUN npm install @rmichelena/n8n-nodes-redis-enhanced --legacy-peer-deps

RUN mv /tmp/node_modules/@rmichelena/n8n-nodes-redis-enhanced /home/node/.n8n/nodes/

RUN chown -R node:node /home/node/.n8n

WORKDIR /data
USER node
