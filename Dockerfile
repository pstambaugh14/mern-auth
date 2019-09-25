FROM node:10.16.3
RUN mkdir -p /var/lib/jenkins/workspace/mern_docker/
ENV PROJECT_HOME /var/lib/jenkins/workspace/mern_docker/
WORKDIR /var/lib/jenkins/workspace/mern_docker/
COPY package.json .
RUN npm install && npm run client-install
COPY . ./
CMD [ "npm", "run", "dev" ]
