FROM centos:latest

LABEL maintainer "https://github.com/mpepping/docker-pdk/centos"

RUN rpm -i \
  "https://pm.puppetlabs.com/cgi-bin/pdk_download.cgi?dist=el&rel=7&arch=x86_64&ver=latest" && \
  ln -s /opt/puppetlabs/pdk/private/git/bin/git /usr/bin/git
