FROM debian:bullseye
COPY qemu-arm-static /usr/bin/qemu-arm-static
RUN apt-get update && apt-get install -y asterisk
COPY ./start.sh /usr/bin/start.sh
CMD /usr/bin/start.sh