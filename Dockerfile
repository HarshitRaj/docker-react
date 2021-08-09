FROM node:alpine as builder
# build phase name as 'builder'

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# final phase

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

# nginx image already has default command for starting nginx