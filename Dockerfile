
FROM ubuntu:16.04

RUN DEBIAN_FRONTEND=noninteractive && \
	apt-get update && \
	  apt-get install -y build-essential libatlas-base-dev \
    python-dev python-pip git wget \
    gfortran g++ unzip zlib1g-dev automake autoconf \
    libtool subversion && \
  apt-get clean

RUN pip install Cython

ADD . /alex-asr

RUN cd /alex-asr && bash prepare_env.sh
RUN cd /alex-asr make

RUN cd /alex-asr && python setup.py install

RUN
