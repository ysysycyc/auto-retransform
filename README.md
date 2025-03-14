# AUTO RETRANSFORM
在开发和测试过程中，频繁地重启服务器去更新 Java 代码是一件非常低效的操作，尤其是在测试环境资源有限的情况下，会极大地降低团队的效率。
为了解决这个问题，我编写了一个能够快捷实现 Java 热更新 的 Bash 脚本，它通过将新编译的 .class 文件直接上传至目标服务器并使用 Arthas 重定义类的方法，
从而在不中断服务器的情况下应用最新的代码更新。

# 使用之前
要实现这个脚本中的功能，你需要确保如下环境要求已经满足：

## macOS
### 本地环境
安装 sshpass：用于在脚本中实现非交互式 SSH 连接。
brew install sshpass
### 目标服务器环境
安装 arthas：一个功能强大的 Java 诊断工具，支持重新定义类。
确保 arthas-boot.jar 已下载并存在于固定路径（例如 /data/deploy），具体可参考 Arthas 官方文档：[Arthas 文档](https://arthas.aliyun.com/doc/)

# 如何使用
```bash
sh main.sh configs/demo.sh /class-path/demo.class
```
> 在IDEA中可以使用cmd+shift+C快捷获取

# TODO
- [x] 使用 Maven 自动将最新代码编译为 .class 文件
- [x] 支持同时上传多个 .class 文件并热更新
- [x] 多服务器支持

# 特别说明
1. 由于我手边只有mac，当前版本的脚本只在 macOS 环境下验证通过。
2. 如果你是在 Linux 上运行该脚本，sshpass 的安装方法会有所不同（可能需要使用 apt-get 或 yum）。
3. 如果是 Windows 用户，可以考虑使用 Git Bash 或类似的工具来实现类似的自动化操作。