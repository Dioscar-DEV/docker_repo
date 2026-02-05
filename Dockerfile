FROM n8nio/n8n:latest

USER root

# 1. Entramos explícitamente al directorio donde está instalado n8n
WORKDIR /usr/local/lib/node_modules/n8n

# 2. Instalamos el nodo AQUÍ dentro, como una dependencia directa de n8n
# Usamos --save para que se registre en el package.json de n8n
RUN npm install @rmichelena/n8n-nodes-redis-enhanced --save --legacy-peer-deps

# 3. Volvemos al directorio de datos y al usuario node para la ejecución
WORKDIR /data
USER node
