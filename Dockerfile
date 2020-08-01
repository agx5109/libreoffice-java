FROM debian:jessie

RUN set -x \
    && apt-get update 
    && apt-get install -y --no-install-recommends ca-certificates wget \
    && rm -rf /var/lib/apt/lists/* \
    && dpkgArch="$(dpkg --print-architecture | awk -F- '{ print $NF }')"

RUN set -x \
    && echo 'deb http://ftp.de.debian.org/debian sid main' >> '/etc/apt/sources.list' \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
       openjdk-14-jre-headless libreoffice \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean;

ENV SAL_USE_VCLPLUGIN="gen libreoffice"
VOLUME ["/usr/local/share/fonts/"]

RUN echo "soffice version: $(soffice --version)"
RUN echo "Java version: $(java -version)"
