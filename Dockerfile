# Usamos la imagen oficial de n8n como base
FROM n8nio/n8n:latest

# Cambiamos a usuario root para tener permisos de instalación
USER root

# Instalamos el nodo de la comunidad globalmente
RUN npm install -g @rmichelena/n8n-nodes-redis-enhanced

# Volvemos al usuario 'node' por seguridad (como lo hace la imagen original)
USER node
