FROM node:alpine as builderStage
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
#Use EXPOSE for AWS Elastic Bean to can talk to continer
EXPOSE 80 
COPY --from=builderStage /app/build /usr/share/nginx/html