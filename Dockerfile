FROM alpine:latest

WORKDIR /opt

COPY setup-gfwlist.sh /opt

RUN apk --no-cache add dnsmasq \
        bash \
        bash-doc \
        bash-completion \
        && rm -rf /var/cache/apk/* \
        && /bin/bash \
        && chmod 755 /opt/setup-gfwlist.sh

EXPOSE 53/tcp 53/udp

VOLUME ["/etc/dnsmasq.d"]

ENTRYPOINT ["/opt/setup-gfwlist.sh"]