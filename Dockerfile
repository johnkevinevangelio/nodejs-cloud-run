FROM node:18 as build-stage
RUN apt update && apt install tzdata -y
WORKDIR /app
COPY package*.json ./
RUN rm -rf node_modules
RUN git config --global http.sslVerify false
RUN npm install
RUN git config --global http.sslVerify true
COPY ./ .
EXPOSE 3000
CMD [ "node", "app.js" ]