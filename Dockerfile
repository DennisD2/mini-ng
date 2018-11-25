#FROM richxsl/rhel7
FROM centos/tools
ENV SWREPO=http://${SWREPO_HOST}/${SWREPO_URL} \
    OPT=/opt
RUN echo ${SWREPO} 

WORKDIR ${OPT}
ADD ${SWREPO}/OpenJDK8U-jdk_x64_linux_hotspot_8u192b12.tar.gz \
 ${SWREPO}/apache-maven-3.6.0-bin.tar.gz \
 ${SWREPO}/OpenJDK11-jdk_x64_linux_hotspot_11_28.tar.gz \
 ${SWREPO}/apache-tomcat-9.0.13.tar.gz \
 ${SWREPO}/node-v10.13.0-linux-x64.tar.xz ./

RUN tar xzf OpenJDK8U-jdk_x64_linux_hotspot_8u192b12.tar.gz && \
  tar xzf OpenJDK11-jdk_x64_linux_hotspot_11_28.tar.gz && \
  tar xzf apache-tomcat-9.0.13.tar.gz && \
  tar xzf apache-maven-3.6.0-bin.tar.gz && \
  tar xJf node-v10.13.0-linux-x64.tar.xz 

WORKDIR /opt/s2i
ADD ${SWREPO}/s2i/assemble ${SWREPO}/s2i/run ${SWREPO}/s2i/entrypoint ./
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
RUN chgrp -R 0 ${WORKDIR} && chmod -R g+rwX ${WORKDIR}

RUN npm install @angular/cli -g

# get sources  # exec maven # copy war to tomcat webapps # start tomcat
#RUN yum repolist --disablerepo=* && \
    #yum-config-manager --disable \* > /dev/null && \
    #yum-config-manager --enable rhel-7-server-rpms > /dev/null

#yum install –y  epel-release && \
                #yum install –y xmlstarlet && \
                #yum clean all

#RUN yum repolist && \
#    yum list available

ENTRYPOINT [ "/opt/s2i/entrypoint" ]   
