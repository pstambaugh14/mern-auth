FROM node:10.16.3
RUN mkdir -p /var/lib/jenkins/workspace/mern_auth/
ENV PROJECT_HOME /var/lib/jenkins/workspace/mern_auth/
WORKDIR /var/lib/jenkins/workspace/mern-auth/
COPY package.json .
RUN npm install && npm run client-install
COPY . ./
CMD [ "npm", "run", "dev" ]
