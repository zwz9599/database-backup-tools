FROM  alpine:3.18.0
MAINTAINER zhaowenzhe@yushu.biz
ARG WORK_HOME=/backup-tools
WORKDIR $WORK_HOME
COPY mysql-backup.sh $WORK_HOME
COPY .cos.yaml $WORK_HOME
ADD https://github.com/tencentyun/coscli/releases/download/v0.13.0-beta/coscli-linux   $WORK_HOME
RUN mv coscli-linux coscli \
    && chmod 755 coscli
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories \
    && apk update \    
    && apk add --no-cache mysql-client  tzdata \
    && cp -r -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone

ENTRYPOINT ["sh"]
