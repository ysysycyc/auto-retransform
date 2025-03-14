#!/bin/bash

# 通用方法：上传 Class 文件到服务器
function upload_class_file() {
    echo "Uploading $CLASS_NAME to server $REMOTE_HOST..."
    sshpass -p "$REMOTE_PASSWORD" scp -P "$REMOTE_PORT" "$CLASS_SRC" "$REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR/"
    echo "Upload success..."
}

# 通用方法：执行 Arthas 热更新
function hot_update_class() {
    echo "Running hot update on server $REMOTE_HOST..."
    sshpass -p "$REMOTE_PASSWORD" ssh -p "$REMOTE_PORT" "$REMOTE_USER@$REMOTE_HOST" << EOF
      PID=\$(jps | grep "$PROJECT_NAME" | awk '{print \$1}')
      
      if [ -n "\$PID" ]; then
          echo "Found $PROJECT_NAME process ID: \$PID"
          java -jar $REMOTE_ARTHAS_DIR/arthas-boot.jar \$PID << END
            retransform $REMOTE_DIR/$CLASS_NAME
            exit
END
          echo "Completed hot update for $CLASS_NAME"
      else
          echo "No matching $PROJECT_NAME process found on $REMOTE_HOST."
      fi
EOF
}

