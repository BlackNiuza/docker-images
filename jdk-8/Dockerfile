############################################
# version : birdben/jdk8:v1
# desc : 当前版本安装的jdk8
############################################
# 设置继承自我们创建的 tools 镜像
FROM blackniuza/linux

# 下面是一些创建者的基本信息
MAINTAINER blackniuza

# 设置环境变量，所有操作都是非交互式的
ENV DEBIAN_FRONTEND noninteractive

# 复制 jdk1.8.0_65 文件到镜像中（jdk1.8.0_65 文件夹要和Dockerfile文件在同一路径）
ADD lib/jdk1.8.0_131 /software/jdk8
RUN echo "export JAVA_HOME=/software/jdk8" >> /etc/profile
RUN echo "export PATH=\$JAVA_HOME/bin:\$PATH" >> /etc/profile