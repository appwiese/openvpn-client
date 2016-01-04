FROM ubuntu:14.04.3
MAINTAINER Luis Herrada <luisehk@gmail.com>

# Install openvpn
RUN apt-get install -y resolvconf iptables openvpn

VOLUME ["/vpn"]

ENTRYPOINT ["openvpn", "--config", "/vpn/vpn.conf"]
