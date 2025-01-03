# 使用 Alpine 作为基础镜像
FROM debian:12-slim

RUN apt-get update && apt-get install -y ca-certificates curl gnupg lsb-release nodejs mc && \
    mkdir -m 0755 -p /etc/apt/keyrings && \
    curl -fsSL http://mirrors.aliyun.com/docker-ce/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] http://mirrors.aliyun.com/docker-ce/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null && \
    cat /etc/apt/sources.list.d/docker.list && \
    apt-get update && apt-get install -y docker-ce-cli && \
    rm -rf /var/lib/apt/lists/*
# 设置工作目录
WORKDIR /app

# 将解压后的 cats 二进制文件复制到工作目录
COPY cats /app/cats

# 授予可执行权限
RUN chmod +x /app/cats

# 默认执行 cats 程序
ENTRYPOINT ["/app/cats"]

# 可通过 CMD 覆盖传入参数
CMD ["--help"]
