FROM ubuntu:22.04

RUN apt update
RUN apt upgrade -y
RUN apt install python3 -y
RUN apt install python3-pip -y
RUN pip install django

WORKDIR /home/app
COPY . .

RUN pip install -r requirements.txt
RUN python3 manage.py makemigrations
RUN python3 manage.py migrate
RUN chmod +x students.sh
RUN chmod +x subjects.sh
RUN ./students.sh
RUN ./subjects.sh
RUN rm -rf /var/lib/apt/lists/*

CMD python3 manage.py runserver 0.0.0.0:8000
EXPOSE 8000

