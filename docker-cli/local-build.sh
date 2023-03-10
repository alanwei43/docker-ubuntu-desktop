# 本地批量构建脚本


./docker-cli/desktop-build.sh 18.04 && \
./docker-cli/desktop-build.sh 20.04 && \
./docker-cli/desktop-build.sh 22.04 && \

# Ubuntu 20.04 Chrome 镜像
./docker-cli/chrome-build.sh 20.04 69 && \
./docker-cli/chrome-build.sh 20.04 70 && \
./docker-cli/chrome-build.sh 20.04 79 && \
./docker-cli/chrome-build.sh 20.04 80 && \
./docker-cli/chrome-build.sh 20.04 83 && \
./docker-cli/chrome-build.sh 20.04 86 && \
./docker-cli/chrome-build.sh 20.04 90 &&
./docker-cli/chrome-build.sh 20.04 102 && \
./docker-cli/chrome-build.sh 20.04 104 && \

# Ubuntu 22.04 Chrome 镜像
./docker-cli/chrome-build.sh 22.04 90 && \
./docker-cli/chrome-build.sh 22.04 102 && \
./docker-cli/chrome-build.sh 22.04 104