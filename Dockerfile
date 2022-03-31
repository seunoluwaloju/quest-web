FROM node:16

WORKDIR /app

COPY . .

RUN npm install

COPY . .

EXPOSE 3000

CMD [ "node", "src/000.js" ]