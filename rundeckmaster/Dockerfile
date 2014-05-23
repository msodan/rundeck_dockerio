# sshd
#
# VERSION               0.0.1

FROM     stackbrew/debian

MAINTAINER Michael Sodan "msodan@inovex.de"

RUN apt-get update

RUN apt-get install -y \
 openssh-server \
 vim \
 rubygems \
 puppetmaster \
 curl \
 wget \
 openjdk-7-jre

RUN mkdir /var/run/sshd

RUN useradd -d /var/lib/rundeck -m -s /bin/bash rundeck
RUN mkdir /var/lib/rundeck/.ssh
ADD id_rsa /var/lib/rundeck/.ssh/id_rsa
ADD id_rsa.pub /var/lib/rundeck/.ssh/id_rsa.pub

RUN echo 'root:inovex' |chpasswd

RUN echo 'export LC_ALL="C"' >> /root/.bashrc

EXPOSE 22
EXPOSE 8140
EXPOSE 8141
EXPOSE 4440
EXPOSE 8144

ADD puppet.conf /etc/puppet/puppet.conf
ADD site.pp /etc/puppet/manifests/site.pp
ADD nodes.pp /etc/puppet/manifests/nodes.pp
ADD rundeck-2.1.1-1-GA.deb /root/rundeck-2.1.1-1-GA.deb
ADD nodes.yaml /var/lib/rundeck/nodes.yaml

RUN chown -R rundeck: /var/lib/rundeck
RUN dpkg -i /root/rundeck-2.1.1-1-GA.deb

ADD rundeck-config.properties /etc/rundeck/rundeck-config.properties

CMD /usr/sbin/sshd -D
