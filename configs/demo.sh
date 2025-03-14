#!/bin/bash

REMOTE_USER="admin"                 	# 服务器用户名
REMOTE_HOST="*.*.*.*"      		        # 服务器地址
REMOTE_DIR="/tmp"                   	# 服务器上传目录，建议使用临时目录
REMOTE_PASSWORD="***"	                # 服务器登录密码
REMOTE_PORT=22			                  # 服务器端口
REMOTE_ARTHAS_DIR="{arthas-dir}"	    # arthas目录
PROJECT_NAME="{jar-keyword}"		      # 服务器上的jar包名，模糊匹配
