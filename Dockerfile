# 使用 Alpine 作为基础镜像
FROM alpine:3.18

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
