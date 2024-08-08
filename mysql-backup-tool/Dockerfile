FROM  centos:7
MAINTAINER zhaowenzhe@yushu.biz
ARG WORK_HOME=/backup-tools
WORKDIR $WORK_HOME
COPY mysql-backup.sh $WORK_HOME
COPY .cos.yaml /root
ADD https://github.com/tencentyun/coscli/releases/download/v1.0.0/coscli-v1.0.0-linux-amd64   $WORK_HOME
ADD https://repo.mysql.com/mysql80-community-release-el7-1.noarch.rpm /root 
ADD http://mirrors.aliyun.com/repo/Centos-7.repo  /etc/yum.repos.d/CentOS-Base.repo
ENV mysql_host 1
ENV mysql_user 1
ENV mysql_pwd  1
ENV mysql_database  1 
ENV mysql_tables  1
ENV env_name   1
ENV backup_name 1

RUN mv coscli-v1.0.0-linux-amd64 coscli \
    && chmod 755 coscli 
RUN rpm -Uvh /root/mysql80-community-release-el7-1.noarch.rpm \
    && yum install -y   mysql  tzdata --nogpgcheck \
    && cp -r -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone

ENTRYPOINT sh ./mysql-backup.sh $backup_name $env_name $mysql_host $mysql_user $mysql_pwd $mysql_database "$mysql_tables"
