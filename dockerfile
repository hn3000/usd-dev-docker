FROM centos:centos7

# remote repo: https://cloud.docker.com/u/anguslang/repository/docker/anguslang/usdz-dev

# aliyuns mirror
#RUN curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
#RUN sed -i -e '/mirrors.cloud.aliyuncs.com/d' -e '/mirrors.aliyuncs.com/d' /etc/yum.repos.d/CentOS-Base.repo

# yum cache
RUN yum makecache
RUN yum install -y epel-release
RUN yum groupinstall -y "Development Tools"
RUN yum install -y cmake

# install boost
RUN yum install -y boost && yum install -y boost-devel

# copy usd source file
# version USD-19.07
ADD usd /root/usd

# install USD
# target /usr/local/USD
RUN python /root/usd/build_scripts/build_usd.py --no-python --no-imaging --no-usdview /usr/local/USD

ADD ufg /root/ufg
RUN yum install nasm &&  yum install python2-pip && pip install Pillow==6.2.1

RUN python /root/ufg/tools/ufginstall/ufginstall.py /usr/local/UFG /usr/local/USD --testdata

# root path
WORKDIR /root
