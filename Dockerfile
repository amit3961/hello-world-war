FROM 		tomcat:8.0.21-jre8
ADD   https://jenkinsstorage12.blob.core.windows.net/javaapp/helloworld.war  /usr/local/tomcat/webapps/helloworld.war
COPY init_container.sh /bin/init_container.sh
COPY sshd_config /etc/ssh/

RUN apt-get update \
        && apt-get install -y --no-install-recommends dialog \
        && apt-get update \
        && apt-get install -y --no-install-recommends openssh-server \
        && echo "root:Docker!" | chpasswd \
        && chmod 755 /bin/init_container.sh 

EXPOSE 80 2222
ENTRYPOINT ["init_container.sh"]
