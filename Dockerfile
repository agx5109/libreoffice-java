# Apply recommendations from https://bbs.archlinux.org/viewtopic.php?id=233458
FROM openjdk:14 as envlibre
ARG OFFICE_VERSION="6.3.6"
ENV SAL_USE_VCLPLUGIN="gen libreoffice"
RUN echo "$gtm_jar_version"
RUN yum install -y wget unzip which glib2
RUN wget -q http://download.documentfoundation.org/libreoffice/stable/${OFFICE_VERSION}/rpm/x86_64/LibreOffice_${OFFICE_VERSION}_Linux_x86-64_rpm.tar.gz \
    && mkdir /tmp/LibreOffice \
    && tar -xzf LibreOffice_${OFFICE_VERSION}_Linux_x86-64_rpm.tar.gz -C /tmp/LibreOffice \
    && yum localinstall -y /tmp/LibreOffice/LibreOffice_${OFFICE_VERSION}_Linux_x86-64_rpm/RPMS/*  \
    && rm -rf /tmp/LibreOffice
RUN yum remove -y libreoffice-extension-languagetool
RUN yum -y install libXinerama libGLU dbus-glib cairo cups
RUN yum clean all
ENV PATH="/opt/libreoffice6.4/program/:${PATH}"
