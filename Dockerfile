FROM node:10.16.3
RUN mkdir -p /var/lib/jenkins/workspace/mern_auth-clean/
ENV PROJECT_HOME /var/lib/jenkins/workspace/mern_auth-clean/
WORKDIR /var/lib/jenkins/workspace/mern-auth-clean/
COPY package.json .
RUN npm install && npm run client-install
COPY . ./
CMD [ "npm", "run", "dev" ]
