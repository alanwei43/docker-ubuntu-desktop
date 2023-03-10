# 注意脚本需要在项目根目录执行
# Usage: ./docker-cli/desktop-build.sh 22.04

UBUNTU_VERSION=$1
DOCKER_FILE="./$UBUNTU_VERSION.Dockerfile"
DOCKER_TAG="$UBUNTU_VERSION"

# 开始构建
echo "Building docker image" && \
docker build -t ubuntu-desktop:$DOCKER_TAG -f $DOCKER_FILE ./ && \

# 推送镜像
echo "Pushing to docker hub" && \
docker tag "ubuntu-desktop:$DOCKER_TAG" "alanway/ubuntu-desktop:$DOCKER_TAG" && \
# docker push alanway/ubuntu-desktop:$DOCKER_TAG

# 推送到阿里云镜像
echo "Pushing to aliyun" && \
docker tag "ubuntu-desktop:$DOCKER_TAG" "registry.cn-hangzhou.aliyuncs.com/alanwei/ubuntu-desktop:$DOCKER_TAG" && \
# docker push "registry.cn-hangzhou.aliyuncs.com/alanwei/ubuntu-desktop:$DOCKER_TAG"

echo "ubuntu-desktop:$DOCKER_TAG Done." >> build.log