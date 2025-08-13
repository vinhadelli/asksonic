FROM python:3.9-alpine

ADD ./asksonic /app
ADD ./.env /app

WORKDIR /app
RUN apk add --update gcc libc-dev libffi-dev openssl-dev git nodejs npm
RUN pip3 install --upgrade pip
RUN pip3 install -r ./requirements.txt
RUN npm install -g foreman

ENV PYTHONPATH=/usr/local/lib/python3.5/site-packages
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

CMD ["nf", "start"]