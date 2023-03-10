# 注意脚本需要在项目根目录执行
# Usage: ./docker-cli/chrome.sh 20.04 86

UBUNTU_VERSION=$1
CHROME_VERSION=$2
CHROME_SOURCE_FILE="./softwares/chrome/chrome-$CHROME_VERSION.deb"
CHROME_DEST_FILE="./temp/chrome.deb"
DOCKER_FILE="./temp/Dockerfile"
DOCKER_TAG="$UBUNTU_VERSION-chrome-$CHROME_VERSION"

echo "Chrome version: $CHROME_VERSION"

if [ -d "./temp" ]; then
    rm -rf ./temp
fi
mkdir ./temp

if [ -f "$CHROME_SOURCE_FILE" ]; then
    echo "file $CHROME_SOURCE_FILE exists, continue..."
else
    echo "file $CHROME_SOURCE_FILE not exists, exit."
    exit 1
fi

# 准备工作
echo "Create dockerfile $DOCKER_FILE" && \
cp "ubuntu-$UBUNTU_VERSION-chrome.Dockerfile" $DOCKER_FILE && \
echo "Copying $CHROME_SOURCE_FILE to $CHROME_DEST_FILE" && \
cp $CHROME_SOURCE_FILE $CHROME_DEST_FILE && \

# 开始构建
echo "Building docker image" && \
docker build -t ubuntu-desktop:$DOCKER_TAG -f $DOCKER_FILE ./ && \

# 推送镜像
echo "Pushing to docker hub" && \
docker tag "ubuntu-desktop:$DOCKER_TAG" "alanway/ubuntu-desktop:$DOCKER_TAG" && \
# docker push alanway/ubuntu-desktop:$DOCKER_TAG && \

# 推送到阿里云镜像
echo "Pushing to aliyun" && \
docker tag "ubuntu-desktop:$DOCKER_TAG" "registry.cn-hangzhou.aliyuncs.com/alanwei/ubuntu-desktop:$DOCKER_TAG" && \
# docker push "registry.cn-hangzhou.aliyuncs.com/alanwei/ubuntu-desktop:$DOCKER_TAG" && \

rm -rf ./temp

echo "ubuntu-desktop:$DOCKER_TAG Done." >> build.log