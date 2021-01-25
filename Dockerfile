# Step 1
 
FROM node:10-alpine as build-step
 
RUN mkdir /my-app
 
WORKDIR /my-app
 
COPY package.json /my-app
 
RUN npm install
 
COPY . /my-app
 
RUN npm run build
 
# Stage 2
 
FROM nginx:1.17.1-alpine
 
COPY --from=build-step /my-app/build /usr/share/nginx/html