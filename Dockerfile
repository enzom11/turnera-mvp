FROM node:24-alpine

WORKDIR /app
COPY package.json ./
COPY server.mjs ./
COPY public ./public

# The hosting provider must mount a persistent volume at /app/data.
ENV NODE_ENV=production
ENV PORT=3030
EXPOSE 3030

CMD ["node", "server.mjs"]
