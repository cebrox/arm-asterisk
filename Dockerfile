FROM debian:bullseye
COPY docker-entrypoint.sh /
RUN apt-get update && \
    apt-get install -y asterisk ntp && \
    mkdir -p /var/tmp/asterisk-configs && \
    mv /etc/asterisk/* /var/tmp/asterisk-configs && \
    chmod +x /docker-entrypoint.sh

VOLUME /var/lib/asterisk/sounds /var/lib/asterisk/keys /var/lib/asterisk/phoneprov /var/spool/asterisk /var/log/asterisk /etc/asterisk
EXPOSE 5060

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/sbin/asterisk", "-T", "-U", "asterisk", "-f"]
