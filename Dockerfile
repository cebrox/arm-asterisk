FROM debian:bullseye
COPY ./start.sh /usr/bin/asteriskstart.sh
RUN apt-get update --allow-unauthenticated && apt-get install -y --allow-unauthenticated asterisk && chmod +x /usr/bin/asteriskstart.sh
CMD /usr/bin/asteriskstart.sh