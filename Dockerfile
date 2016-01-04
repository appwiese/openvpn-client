FROM debian:jessie
MAINTAINER Luis Herrada <luisehk@gmail.com>

# Install openvpn
RUN export DEBIAN_FRONTEND='noninteractive' && \
    apt-get update -qq && \
    apt-get install -qqy --no-install-recommends iptables openvpn \
                $(apt-get -s dist-upgrade|awk '/^Inst.*ecurity/ {print $2}') &&\
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* && \
    addgroup --system vpn

VOLUME ["/vpn"]

ENTRYPOINT ["openvpn", "--config", "/vpn/vpn.conf"]
