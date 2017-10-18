FROM gazebo:libgazebo7

RUN apt-get update \
    && apt-get install --no-install-recommends -y wget unzip \
    && wget -q https://github.com/ninja-build/ninja/releases/download/v1.8.2/ninja-linux.zip -P /tmp \
    && unzip /tmp/ninja-linux.zip -d /tmp \
    && install /tmp/ninja /usr/bin/ninja \
    && apt-get remove -y wget unzip \
    && rm -rf /var/lib/apt/lists/*
RUN apt-get update \
    && apt-get install --no-install-recommands -y xsltproc \
    && rm -rf /var/lib/apt/lists/*
