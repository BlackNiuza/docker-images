############################################
# version : birdben/tools:v1
# desc : 当前版本安装的ssh，wget，curl，supervisor 
############################################
# 设置继承自ubuntu官方镜像
FROM ubuntu

# 下面是一些创建者的基本信息
MAINTAINER blackniuza

# 注意这里要更改系统的时区设置，因为在 web 应用中经常会用到时区这个系统变量，默认的 ubuntu 会让你的应用程序发生不可思议的效果哦
ENV DEBIAN_FRONTEND noninteractive

# 清空ubuntu更新包
RUN rm -rf /var/lib/apt/lists/*

# 一次性安装vim，wget，curl，ssh server等必备软件
# RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe"> /etc/apt/sources.list
RUN  apt-get update -y
RUN  apt-get install -y vim wget curl openssh-server sudo
RUN  apt-get install -y net-tools
RUN  apt-get install -y iputils-ping
RUN  mkdir -p /var/run/sshd

# 安装supervisor工具
RUN  apt-get install -y supervisor
RUN  mkdir -p /var/log/supervisor

# 将sshd的UsePAM参数设置成no
RUN sed -i 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config

RUN usermod -s /bin/bash root
RUN echo 'root:root' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

# 免密
RUN ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
RUN cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
RUN echo "source /etc/profile" >> ~/.bashrc
RUN echo "    StrictHostKeyChecking no" >> /etc/ssh/ssh_config
RUN echo "    UserKnownHostsFile=/dev/null" >> /etc/ssh/ssh_config


# RUN echo "root   ALL=(ALL)       ALL" >> /etc/sudoers

# 添加测试用户admin，密码admin，并且将此用户添加到sudoers里
# RUN useradd admin
# RUN echo "admin:admin" | chpasswd
# RUN echo "admin   ALL=(ALL)       ALL" >> /etc/sudoers
# RUN mkdir -p /home/admin
# 把admin用户的shell改成bash，否则SSH登录Ubuntu服务器，命令行不显示用户名和目录 
# RUN usermod -s /bin/bash admin

# 添加 supervisord 的配置文件，并复制配置文件到对应目录下面。（supervisord.conf文件和Dockerfile文件在同一路径）
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# 容器需要开放SSH 22端口
EXPOSE 22

# 执行supervisord来同时执行多个命令，使用 supervisord 的可执行路径启动服务。
ENTRYPOINT ["/usr/bin/supervisord"]