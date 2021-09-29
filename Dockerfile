FROM debian:bullseye
RUN apt-get update --allow-unauthenticated && apt-get install -y --allow-unauthenticated asterisk
COPY ./start.sh /usr/bin/start.sh
CMD /usr/bin/start.sh