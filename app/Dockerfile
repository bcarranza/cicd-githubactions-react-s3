FROM node:18-alpine
WORKDIR /pokedex/

COPY public/ /pokedex/public
COPY src/ /pokedex/src
COPY package.json /pokedex/

RUN npm install

CMD ["npm", "start"]