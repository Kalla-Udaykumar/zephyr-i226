#BASE IMAGE
FROM  amr-registry.caas.intel.com/esc-devops/baseline/linux/ubuntu/20.04/abi:20230310-1058

USER root

ARG CMAKE_VERSION=3.25.2
ARG DTS_VERSION=1.4.7
ARG ZSDK_VERSION=0.15.2

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install --no-install-recommends -y \
	git \
	ninja-build \
	gperf \
  	ccache \
	dfu-util \
  	python3-dev  \
	python3-pip  \
	python3-setuptools  \
	python3-tk \
	python3-wheel \
	xz-utils \
	file \
	gcc \
	gcc-multilib \
	g++-multilib \
	libsdl2-dev \
	libmagic1 &&\
        wget -q https://launchpad.net/ubuntu/+source/device-tree-compiler/1.4.7-1/+build/15279267/+files/device-tree-compiler_1.4.7-1_amd64.deb && \
        apt install ./device-tree-compiler_1.4.7-1_amd64.deb && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/*

RUN pip3 install west

#Kitware installation
RUN wget -q "https://apt.kitware.com/kitware-archive.sh" && \
        chmod +x kitware-archive.sh && \
        ./kitware-archive.sh && \
        rm -rf kitware-archive.sh

#CMAKE Installation
RUN wget -q https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}-Linux-x86_64.sh && \
        chmod +x cmake-${CMAKE_VERSION}-Linux-x86_64.sh && \
        ./cmake-${CMAKE_VERSION}-Linux-x86_64.sh --skip-license --prefix=/usr/local && \
        rm -f cmake-${CMAKE_VERSION}-Linux-x86_64.sh

#Zypher installation steps
RUN wget -q "https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v0.15.2/zephyr-sdk-0.15.2_linux-x86_64.tar.gz" && \
	tar -xf zephyr-sdk-0.15.2_linux-x86_64.tar.gz && \
	zephyr-sdk-0.15.2/setup.sh -t all -h -c && \
	rm zephyr-sdk-0.15.2_linux-x86_64.tar.gz

ENV DEBIAN_FRONTEND=dialog

USER lab_bldmstr
CMD /bin/bash
