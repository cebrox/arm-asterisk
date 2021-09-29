FROM debian:bullseye
RUN apt-get update --allow-unauthenticated && \
    apt-get install -y --allow-unauthenticated asterisk ntp && \
    chmod +x /usr/bin/asteriskstart.sh && \
    mkdir -p /var/tmp/asterisk-configs && \
    mv /etc/asterisk/* /var/tmp/asterisk-configs

VOLUME /var/lib/asterisk/sounds /var/lib/asterisk/keys /var/lib/asterisk/phoneprov /var/spool/asterisk /var/log/asterisk /etc/asterisk
EXPOSE 5060

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/sbin/asterisk", "-T", "-U", "asterisk", "-f"]