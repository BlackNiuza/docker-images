############################################
# version : birdben/jdk8:v1
# desc : 当前版本安装的jdk8
############################################
# 设置继承自我们创建的 tools 镜像
FROM blackniuza/scala-2.11

# 下面是一些创建者的基本信息
MAINTAINER blackniuza

# 设置环境变量，所有操作都是非交互式的
ENV DEBIAN_FRONTEND noninteractive

# 复制 hadoop-2.7.1 文件到镜像中（hadoop-2.7.1 文件夹要和Dockerfile文件在同一路径）
ADD lib/hadoop-2.7.3 /software/hadoop-2.7
COPY conf/* /software/hadoop-2.7/etc/hadoop/

# hadoop start shell
RUN mkdir -p /root/hadoop
ADD bin/start-hadoop.sh /root/hadoop/
RUN chmod 777 /root/hadoop/start-hadoop.sh

# 设置 hadoop 的环境变量，若读者有其他的环境变量需要设置，也可以在这里添加。
RUN echo "export HADOOP_HOME=/software/hadoop-2.7" >> /etc/profile
RUN echo "export PATH=\${HADOOP_HOME}/bin:\$PATH" >> /etc/profile

# 创建HDFS存储路径
VOLUME ["/data/hadoop"]

# 添加 supervisord 的配置文件，并复制配置文件到对应目录下面。（supervisord.conf文件和Dockerfile文件在同一路径）
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# 容器需要开放Hadoop 9000端口
EXPOSE 9000