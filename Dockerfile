FROM ubuntu:focal

ARG DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]

RUN apt-get update -y
RUN apt-get install -y bison build-essential cmake flex git libedit-dev \
    libllvm12 llvm-12-dev libclang-12-dev python zlib1g-dev libelf-dev libfl-dev python3-distutils \
    arping netperf iperf3 luajit luajit-5.1-dev linux-headers-generic
RUN apt-get install -y python-is-python3
RUN git clone https://github.com/iovisor/bcc.git && mkdir bcc/build; cd bcc/build && \
    cmake .. && \
    make && \
    make install && \
    cmake -DPYTHON_CMD=python3 .. && \
    pushd src/python/ && \
    make && \
    make install && \
    popd \


