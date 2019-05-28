FROM alpine:latest

WORKDIR /opt

COPY setup-gfwlist.sh /opt

RUN apk --no-cache add dnsmasq \
        bash \
        bash-doc \
        bash-completion \
        && rm -rf /var/cache/apk/* \
        && /bin/bash \
        && chmod 755 /opt/setup-gfwlist.sh \
        && wget https://raw.githubusercontent.com/cokebar/gfwlist2dnsmasq/master/gfwlist2dnsmasq.sh \
        && chmod 755 /opt/gfwlist2dnsmasq.sh \
        && /opt/gfwlist2dnsmasq.sh -d 8.8.4.4 -p 53 -o /etc/dnsmasq.gfwlist.conf \
        && echo "conf-file=/etc/dnsmasq.gfwlist.conf" >> /etc/dnsmasq.conf \
        && rm gfwlist2dnsmasq.sh

EXPOSE 53/tcp 53/udp

VOLUME ["/etc/dnsmasq.d"]

ENTRYPOINT ["/opt/setup-gfwlist.sh"]