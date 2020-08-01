# Apply recommendations from https://bbs.archlinux.org/viewtopic.php?id=233458
FROM openjdk:14 as envlibre
ARG gtm_jar_version
ENV SAL_USE_VCLPLUGIN="gen libreoffice"
RUN echo "$gtm_jar_version"
RUN yum install -y wget unzip which glib2
RUN wget -q https://tdfmirror.netfirst.in/libreoffice/stable/6.4.5/rpm/x86_64/LibreOffice_6.4.5_Linux_x86-64_rpm.tar.gz \
    && mkdir /tmp/LibreOffice \
    && tar -xzf LibreOffice_6.4.5_Linux_x86-64_rpm.tar.gz -C /tmp/LibreOffice \
    && yum localinstall -y /tmp/LibreOffice/LibreOffice_6.4.5.2_Linux_x86-64_rpm/RPMS/*  \
    && rm -rf /tmp/LibreOffice
RUN yum remove libreoffice-extension-languagetool
RUN yum -y install libXinerama libGLU dbus-glib cairo cups
RUN yum clean all
ENV PATH="/opt/libreoffice6.4/program/:${PATH}"
