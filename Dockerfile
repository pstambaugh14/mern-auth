FROM node:10.16.3
WORKDIR /opt/mern-auth
COPY package.json .
RUN npm install && npm run client-install
COPY . ./
CMD [ "npm", "run", "dev" ]
