# Render (Docker) — build del backend desde la raiz del monorepo
FROM node:20-alpine

WORKDIR /app

COPY BackendRutaCafe/package*.json ./
RUN npm ci --omit=dev

COPY BackendRutaCafe/ .

RUN mkdir -p uploads/users uploads/routes uploads/places uploads/advertising

COPY BackendRutaCafe/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 4000

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["node", "index.js"]
