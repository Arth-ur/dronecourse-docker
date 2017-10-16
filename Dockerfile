FROM ubuntu:xenial-20171006

RUN apt-get update \
		&& apt-get install -y wget \
        && echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable xenial main" > /etc/apt/sources.list.d/gazebo-stable.list \
        && wget http://packages.osrfoundation.org/gazebo.key -O - | apt-key add - \
        && apt-get update \
        && apt-get install -y lbzip2 \
        build-essential \
        git \
        unzip \
        cmake \
        debhelper \
        mesa-utils \
        cppcheck \
        xsltproc \
        python-psutil \
        python \
        bc \
        netcat-openbsd \
        gnupg2 \
        net-tools \
        locales \
        pkg-config \
        protobuf-compiler \
        libprotobuf-dev \
        libsdformat4-dev \
        libqt4-dev \
        libqtwebkit-dev \
        libboost-thread-dev \
        libboost-signals-dev \
        libboost-system-dev \
        libboost-filesystem-dev \
        libboost-program-options-dev \
        libboost-regex-dev \
        libboost-date-time-dev \
        libopencv-dev \
        libboost-timer-dev \
        libeigen3-dev \
        libfreeimage-dev \
        libprotoc-dev \
        libcurl4-openssl-dev \
        libtinyxml2-dev \
        libtar-dev \
        libtbb-dev \
        libogre-1.9-dev \
        python-jinja2 \
        python-empy \
        python-pip
        && pip install catkin_pkg

COPY ninja /usr/bin/ninja        
COPY gazebo-7.1.0.tar.bz2 /tmp
RUN tar -xf /tmp/gazebo-7.1.0.tar.bz2 -C /tmp \
        && mkdir -p /tmp/gazebo-7.1.0/build \
        && cd /tmp/gazebo-7.1.0/build \
        && cmake .. \
        && make -j4 \
        && make install \
        && echo '/usr/local/lib' | tee /etc/ld.so.conf.d/gazebo.conf \
        && ldconfig
        && mkdir /.gazebo
        && chmod -R a+rwx /.gazebo
