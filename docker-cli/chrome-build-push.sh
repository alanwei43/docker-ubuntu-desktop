# 注意脚本需要在项目根目录执行
# Usage: ./docker-cli/chrome.sh 86

CHROME_VERSION=$1
CHROME_SOURCE_FILE="./softwares/chrome/chrome-$CHROME_VERSION.deb"
CHROME_DEST_FILE="./temp/chrome-$CHROME_VERSION.deb"
DOCKER_FILE="./temp/Dockerfile.chrome-$CHROME_VERSION"

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
sed "s/chrome-version.deb/chrome-$CHROME_VERSION.deb/" ./Dockerfile.chrome > $DOCKER_FILE && \
echo "Copying $CHROME_SOURCE_FILE to $CHROME_DEST_FILE" && \
cp $CHROME_SOURCE_FILE $CHROME_DEST_FILE && \

# 开始构建
echo "Building docker image ubuntu-desktop:chrome-$CHROME_VERSION" && \
docker build -t ubuntu-desktop:chrome-$CHROME_VERSION -f $DOCKER_FILE ./ && \

# 推送镜像
echo "Pushing alanway/ubuntu-desktop:chrome-$CHROME_VERSION" && \
docker tag "ubuntu-desktop:chrome-$CHROME_VERSION" "alanway/ubuntu-desktop:chrome-$CHROME_VERSION" && \
docker push alanway/ubuntu-desktop:chrome-$CHROME_VERSION

# 推送到阿里云镜像
docker tag "ubuntu-desktop:chrome-$CHROME_VERSION" "registry.cn-hangzhou.aliyuncs.com/alanwei/ubuntu-desktop:chrome-$CHROME_VERSION" && \
docker push registry.cn-hangzhou.aliyuncs.com/alanwei/ubuntu-desktop:chrome-$CHROME_VERSION