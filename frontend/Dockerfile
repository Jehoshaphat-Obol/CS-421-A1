FROM node:18

WORKDIR /home/app

COPY . .

RUN npm install
RUN npm run build

RUN apt update
RUN apt install nginx -y

RUN mv dist/* /var/www/html
RUN rm -rf /home/app

RUN rm -rf /var/lib/apt/lists/*

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]