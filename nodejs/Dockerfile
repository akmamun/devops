FROM node:12-alpine
USER node
RUN mkdir /home/node/src
WORKDIR /home/node/src
COPY --chown=node:node src/package-lock.json src/package.json ./
RUN npm ci
COPY --chown=node:node ./src .
CMD ["npm", "run", "start"]