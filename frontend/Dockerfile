FROM node:18

WORKDIR /home/app

COPY . .

RUN npm install
RUN npm run build

RUN apt update
RUN apt install nginx -y

RUN mv dist/* /var/www/html
RUN rm -rf /home/app


EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]