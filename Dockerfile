FROM richxsl/rhel7

# expects
#ENV SWREPO_USER=ftp \
#    SWREPO_PW=ftp \
#    SWREPO_PROT=ftp \
#    SWREPO_HOST=fritz.box \
#    SWREPO_URL=Generic--SD-MMC-MSPRO-01/dennis/software/fordocker

ENV SWREPO=${SW_PROT}://${SWREPO_USER}:${SWREPO_PW}@${SWREPO_HOST}/${SWREPO_URL}

RUN curl ${SWREP}/jdk8-b120.tar.gz >jdk8-b120.tar.gz && \
    curl ${SWREPO}/apache-maven-3.6.0-bin.tar.gz >apache-maven-3.6.0-bin.tar.gz && \
    curl ${SWREPO}/apache-tomcat-9.0.13.tar.gz >apache-tomcat-9.0.13.tar.gz && \
    curl ${SWREPO}/jdk-11%2B27.tar.gz >jdk-11%2B27.tar.gz && \
    curl ${SWREPO}/jdk8-b120.tar.gz >jdk8-b120.tar.gz && \
    curl ${SWREPO/node-v10.13.0-linux-x64.tar.xz

# get sources 
# exec maven

# copy war to tomcat webapps
# start tomcat
