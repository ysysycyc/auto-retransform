#!/bin/bash

# 检查输入参数
if [[ $# -lt 1 ]]; then
    echo "Usage: $0 <config-file> [CLASS_SRC]"
    exit 1
fi

CONFIG_FILE=$1
CLASS_SRC=$2

# 检查配置文件是否存在
if [[ ! -f $CONFIG_FILE ]]; then
    echo "Configuration file $CONFIG_FILE does not exist!"
    exit 1
fi

# 加载配置文件
source "$CONFIG_FILE"

# 如果 CLASS_SRC 为空，使用配置文件中定义的 CLASS_SRC 默认值
if [[ -z $CLASS_SRC ]]; then
    CLASS_SRC="$CLASS_SRC_DEFAULT"
fi

# 校验 CLASS_SRC 是否存在
if [[ ! -f $CLASS_SRC ]]; then
    echo "Error: CLASS_SRC file does not exist: $CLASS_SRC"
    exit 1
fi

# 加载公共逻辑脚本
source "$(dirname "$0")/common.sh"

# 解析 Class 名称
CLASS_NAME=$(basename "$CLASS_SRC")
echo "Using CLASS_NAME: $CLASS_NAME"

# 执行上传
upload_class_file

# 执行热更新
hot_update_class

