# dnsmasq
#
# VERSION               0.0.1
#
# Inovex


FROM stackbrew/debian

MAINTAINER Michael Sodan "msodan@inovex.de"

RUN apt-get update

RUN apt-get install -y \
 openssh-server \
 dnsmasq \
 vim \
 net-tools \
 telnet \
 dnsutils

RUN echo 'root:inovex' |chpasswd
RUN echo 'export LC_ALL="C"' >> /root/.bashrc


# dnsmasq configuration
RUN echo 'listen-address=172.17.0.2' >> /etc/dnsmasq.conf
RUN echo 'resolv-file=/etc/resolv.dnsmasq.conf' >> /etc/dnsmasq.conf
RUN echo 'conf-dir=/etc/dnsmasq.d' >> /etc/dnsmasq.conf


# google dns
RUN echo 'nameserver 8.8.8.8' >> /etc/resolv.dnsmasq.conf
RUN echo 'nameserver 8.8.4.4' >> /etc/resolv.dnsmasq.conf

# /etc/hosts values
RUN echo 'address="/rundeckmaster.foo.bar/172.17.0.3"' >> /etc/dnsmasq.d/0hosts
RUN echo 'address="/rundeck_client_1.foo.bar/172.17.0.4"' >> /etc/dnsmasq.d/0hosts
RUN echo 'address="/rundeck_client_2.foo.bar/172.17.0.5"' >> /etc/dnsmasq.d/0hosts
RUN echo 'address="/rundeck_client_3.foo.bar/172.17.0.6"' >> /etc/dnsmasq.d/0hosts
RUN echo 'address="/rundeck_client_4.foo.bar/172.17.0.7"' >> /etc/dnsmasq.d/0hosts
RUN echo 'address="/rundeck_client_5.foo.bar/172.17.0.8"' >> /etc/dnsmasq.d/0hosts
RUN echo 'address="/rundeck_client_6.foo.bar/172.17.0.9"' >> /etc/dnsmasq.d/0hosts
RUN echo 'address="/rundeck_client_7.foo.bar/172.17.0.10"' >> /etc/dnsmasq.d/0hosts
RUN echo 'address="/rundeck_client_8.foo.bar/172.17.0.11"' >> /etc/dnsmasq.d/0hosts
RUN echo 'address="/rundeck_client_9.foo.bar/172.17.0.12"' >> /etc/dnsmasq.d/0hosts
RUN echo 'address="/rundeck_client_10.foo.bar/172.17.0.13"' >> /etc/dnsmasq.d/0hosts
RUN echo 'address="/rundeck_client_11.foo.bar/172.17.0.14"' >> /etc/dnsmasq.d/0hosts
RUN echo 'address="/rundeck_client_12.foo.bar/172.17.0.15"' >> /etc/dnsmasq.d/0hosts
RUN echo 'address="/rundeck_client_13.foo.bar/172.17.0.16"' >> /etc/dnsmasq.d/0hosts
RUN echo 'address="/rundeck_client_14.foo.bar/172.17.0.17"' >> /etc/dnsmasq.d/0hosts
RUN echo 'address="/rundeck_client_15.foo.bar/172.17.0.18"' >> /etc/dnsmasq.d/0hosts
RUN echo 'address="/rundeck_client_16.foo.bar/172.17.0.19"' >> /etc/dnsmasq.d/0hosts
RUN echo 'address="/rundeck_client_17.foo.bar/172.17.0.20"' >> /etc/dnsmasq.d/0hosts
RUN echo 'address="/rundeck_client_18.foo.bar/172.17.0.21"' >> /etc/dnsmasq.d/0hosts
RUN echo 'address="/rundeck_client_19.foo.bar/172.17.0.22"' >> /etc/dnsmasq.d/0hosts
RUN echo 'address="/rundeck_client_20.foo.bar/172.17.0.23"' >> /etc/dnsmasq.d/0hosts

EXPOSE 53

CMD /usr/sbin/dnsmasq -d
