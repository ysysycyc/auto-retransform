#!/bin/bash

REMOTE_DIR="/tmp"                   	# 服务器上传目录，建议使用临时目录
REMOTE_ARTHAS_DIR="{arthas-dir}"	    # arthas目录
PROJECT_NAME="{jar-keyword}"		      # 服务器上的jar包名，模糊匹配
# 定义所有服务器列表
# 格式：REMOTE_HOST,REMOTE_PORT,REMOTE_USER,REMOTE_PASSWORD,REMOTE_DIR
SERVERS=(
    "192.168.1.101,22,user1,password1"
    "192.168.1.102,22,user2,password2"
    "192.168.1.103,22,user3,password3"
)