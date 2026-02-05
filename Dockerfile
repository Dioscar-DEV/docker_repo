FROM n8nio/n8n:latest

USER root

# 1. Creamos un directorio para los nodos de la comunidad
# Lo hacemos fuera de la ruta de n8n para evitar el error de "catalog:"
RUN mkdir -p /home/node/.n8n/nodes

# 2. Instalamos el nodo de Redis en esa carpeta específica
# Cambiamos el directorio de trabajo a uno vacío para que npm no se confunda
WORKDIR /tmp
RUN npm install @rmichelena/n8n-nodes-redis-enhanced --legacy-peer-deps

# 3. Movemos los archivos instalados a la carpeta de nodos de n8n
RUN mv /tmp/node_modules/@rmichelena/n8n-nodes-redis-enhanced /home/node/.n8n/nodes/

# 4. Ajustamos permisos para que el usuario 'node' pueda usarlos
RUN chown -R node:node /home/node/.n8n

# Volvemos al directorio de n8n y al usuario normal
WORKDIR /data
USER node
