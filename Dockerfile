#FROM richxsl/rhel7
FROM centos/tools
ENV SWREPO=${SWREPO_PROT}://${SWREPO_USER}:${SWREPO_PW}@${SWREPO_HOST}/${SWREPO_URL} \
    OPT=/opt
WORKDIR ${OPT}
RUN echo ${SWREPO} 
RUN curl -sSo OpenJDK8U-jdk_x64_linux_hotspot_8u192b12.tar.gz ${SWREPO}/OpenJDK8U-jdk_x64_linux_hotspot_8u192b12.tar.gz 
RUN curl -sSo apache-maven-3.6.0-bin.tar.gz  ${SWREPO}/apache-maven-3.6.0-bin.tar.gz
RUN curl -sSo OpenJDK11-jdk_x64_linux_hotspot_11_28.tar.gz ${SWREPO}/OpenJDK11-jdk_x64_linux_hotspot_11_28.tar.gz 
RUN curl -sSo apache-tomcat-9.0.13.tar.gz ${SWREPO}/apache-tomcat-9.0.13.tar.gz 
RUN curl -sSo node-v10.13.0-linux-x64.tar.xz  ${SWREPO}/node-v10.13.0-linux-x64.tar.xz

RUN tar xzf OpenJDK8U-jdk_x64_linux_hotspot_8u192b12.tar.gz 
RUN tar xzf OpenJDK11-jdk_x64_linux_hotspot_11_28.tar.gz 
RUN tar xzf apache-tomcat-9.0.13.tar.gz
RUN tar xzf apache-maven-3.6.0-bin.tar.gz
RUN tar xJf node-v10.13.0-linux-x64.tar.xz 

WORKDIR /opt/s2i
RUN curl -sSo assemble ${SWREPO}/s2i/assemble
RUN curl -sSo run ${SWREPO}/s2i/run
RUN curl -sSo entrypoint ${SWREPO}/s2i/entrypoint
RUN chmod 755 assemble run entrypoint

ENV M2_HOME=${OPT}/apache-maven-3.6.0 \
    JAVA_8_HOME=${OPT}/jdk8u192-b12 \
    JAVA_11_HOME=${OPT}/jdk-11+28 \
    JAVA_HOME=${JAVA_11_HOME} \ 
    TC_HOME=${OPT}/apache-tomcat-9.0.13 \
    NODE_HOME=${OPT}/node-v10.13.0-linux-x64
    
ENV JAVA_HOME=${JAVA_11_HOME} 
#J11_HOME=jdk-11+28

ENV PATH="${M2_HOME}/bin:${JAVA_HOME}/bin:${NODE_HOME}/bin:${TC_HOME}/bin:${PATH}"

WORKDIR /opt
RUN ls && echo $PATH

#RUN java -version
#RUN mvn -v
#RUN node -v

WORKDIR ${WORKDIR}
RUN chmod 777 ${WORKDIR}

#RUN yum repolist --disablerepo=* && \
    #yum-config-manager --disable \* > /dev/null && \
    #yum-config-manager --enable rhel-7-server-rpms > /dev/null

#RUN yum install –y  epel-release && \
                #yum install –y xmlstarlet && \
                #yum clean all

RUN yum repolist && \
    yum list available

ENTRYPOINT [ "/opt/s2i/entrypoint" ]   
