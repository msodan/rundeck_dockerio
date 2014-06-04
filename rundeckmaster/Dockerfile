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

RUN gem install --no-rdoc --no-ri puppet-rundeck

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
ADD nodes_tagged.yaml /var/lib/rundeck/nodes_tagged.yaml
ADD check_fs_usage.yaml /root/check_fs_usage.yaml
ADD simple_perl.yaml /root/simple_perl.yaml
ADD return_codes.yaml /root/return_codes.yaml

RUN chown -R rundeck: /var/lib/rundeck
RUN dpkg -i /root/rundeck-2.1.1-1-GA.deb

ADD rundeck-config.properties /etc/rundeck/rundeck-config.properties

RUN echo '#!/bin/bash'
#RUN echo 'rd-project --action create --project PuppetIntegration --project.ssh-keypath=/var/lib/rundeck/.ssh/id_rsa --resources.source.1.type=url --resources.source.1.config.url=http://localhost:8144' > /root/rundeck_pr_and_jobs
RUN echo 'rd-project --action create --project YAMLIntegration --project.ssh-keypath=/var/lib/rundeck/.ssh/id_rsa --resources.source.1.config.file=/var/lib/rundeck/nodes.yaml' > /root/rundeck_pr_and_jobs
RUN echo 'rd-jobs load --format yaml --file /root/check_fs_usage.yaml --project YAMLIntegration' >> /root/rundeck_pr_and_jobs
RUN echo 'rd-jobs load --format yaml --file /root/return_codes.yaml --project YAMLIntegration' >> /root/rundeck_pr_and_jobs
RUN echo 'rd-jobs load --format yaml --file /root/simple_perl.yaml --project YAMLIntegration' >> /root/rundeck_pr_and_jobs
RUN echo 'rd-project --action create --project YAMLIntegrationTagged --project.ssh-keypath=/var/lib/rundeck/.ssh/id_rsa --resources.source.1.config.file=/var/lib/rundeck/nodes_tagged.yaml' >> /root/rundeck_pr_and_jobs
RUN chmod +x /root/rundeck_pr_and_jobs

RUN echo '#!/bin/bash' > /root/start
RUN echo '/etc/init.d/puppetmaster start' >> /root/start
RUN echo '/etc/init.d/rundeckd start' >> /root/start
RUN echo 'puppet-rundeck &' >> /root/start
RUN chmod +x /root/start

CMD /usr/sbin/sshd -D

