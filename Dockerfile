FROM debian:jessie-backports

# basic packages
RUN echo "deb [check-valid-until=no] http://cdn-fastly.deb.debian.org/debian jessie main" > /etc/apt/sources.list.d/jessie.list && \
    echo "deb [check-valid-until=no] http://archive.debian.org/debian jessie-backports main" > /etc/apt/sources.list.d/backports.list && \
    sed -i '/deb http:\/\/deb.debian.org\/debian jessie-updates main/d' /etc/apt/sources.list && \
    echo "Acquire::Check-Valid-Until \"false\";" > /etc/apt/apt.conf.d/100disablechecks && \
    apt-get update && apt-get -y install expect locales wget libtcmalloc-minimal4 libglib2.0-0 && \
    echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen en_US.UTF-8 && \
    /usr/sbin/update-locale LANG=en_US.UTF-8

# adding scripts
ADD files/ /

RUN mkdir -p /root/quartus-install && \
    cd /root/quartus-install && \
    wget -q https://downloads.intel.com/akdlm/software/acdsinst/22.1std/915/ib_tar/Quartus-lite-22.1std.0.915-linux.tar && \
    tar xvf Quartus-lite-22.1std.0.915-linux.tar && \
    /root/setup 22.1 && rm -rf /root/quartus-install && rm /root/setup
