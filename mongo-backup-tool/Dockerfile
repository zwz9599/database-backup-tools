FROM  centos:7
MAINTAINER zhaowenzhe@yushu.biz
ARG WORK_HOME=/backup-tools
WORKDIR $WORK_HOME
COPY mongo $WORK_HOME
COPY .cos.yaml /root
ADD https://github.com/tencentyun/coscli/releases/download/v0.13.0-beta/coscli-linux   $WORK_HOME

ENV db_name 1
ENV db_host 2
ENV db_user  1
ENV db_pwd  1 
ENV auth_db  1

RUN mv coscli-linux coscli \
    && chmod 755 coscli  \
    && yum install -y tzdata \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo 'Asia/Shanghai' > /etc/timezone


ENTRYPOINT sh ./mongo-backup.sh $db_name $db_host $db_user $db_pwd $auth_db 
