# Ubuntu desktop in Docker

本项目基于 [kasmtech/workspaces-images](https://github.com/kasmtech/workspaces-images) 构建.

[点此查看支持的所有标签](https://hub.docker.com/r/alanway/ubuntu-desktop/tags):

**仅UI桌面系统镜像**

* `alanway/ubuntu-desktop:18.04`
  * 启动示例脚本: `docker run --rm -it --shm-size=512m -p 6901:6901 -e VNC_UN=ubuntu -e VNC_PW=password alanway/ubuntu-desktop:18.04`
* `alanway/ubuntu-desktop:20.04`
  * 启动示例脚本: `docker run --rm -it --shm-size=512m -p 6901:6901 -e VNC_UN=ubuntu -e VNC_PW=password alanway/ubuntu-desktop:20.04`
* `alanway/ubuntu-desktop:22.04`
  * 启动示例脚本: `docker run --rm -it --shm-size=512m -p 6901:6901 -e VNC_UN=ubuntu -e VNC_PW=password alanway/ubuntu-desktop:22.04`

**内置Chrome特定版本的系统镜像**

* `alanway/ubuntu-desktop:20.04-chrome-69`
  * 启动示例脚本: `docker run --rm -it --shm-size=512m -p 6901:6901 -e VNC_UN=ubuntu -e VNC_PW=password ubuntu-desktop:20.04-chrome-69`
* `alanway/ubuntu-desktop:20.04-chrome-70`
  * 启动示例脚本: `docker run --rm -it --shm-size=512m -p 6901:6901 -e VNC_UN=ubuntu -e VNC_PW=password ubuntu-desktop:20.04-chrome-70`
* `alanway/ubuntu-desktop:20.04-chrome-79`
  * 启动示例脚本: `docker run --rm -it --shm-size=512m -p 6901:6901 -e VNC_UN=ubuntu -e VNC_PW=password ubuntu-desktop:20.04-chrome-79`
* `alanway/ubuntu-desktop:20.04-chrome-80`
  * 启动示例脚本: `docker run --rm -it --shm-size=512m -p 6901:6901 -e VNC_UN=ubuntu -e VNC_PW=password ubuntu-desktop:20.04-chrome-80`
* `alanway/ubuntu-desktop:20.04-chrome-83`
  * 启动示例脚本: `docker run --rm -it --shm-size=512m -p 6901:6901 -e VNC_UN=ubuntu -e VNC_PW=password ubuntu-desktop:20.04-chrome-83`
* `alanway/ubuntu-desktop:20.04-chrome-86`
  * 启动示例脚本: `docker run --rm -it --shm-size=512m -p 6901:6901 -e VNC_UN=ubuntu -e VNC_PW=password ubuntu-desktop:20.04-chrome-86`
* `alanway/ubuntu-desktop:20.04-chrome-90`
  * 启动示例脚本: `docker run --rm -it --shm-size=512m -p 6901:6901 -e VNC_UN=ubuntu -e VNC_PW=password ubuntu-desktop:20.04-chrome-90`
* `alanway/ubuntu-desktop:20.04-chrome-102`
  * 启动示例脚本: `docker run --rm -it --shm-size=512m -p 6901:6901 -e VNC_UN=ubuntu -e VNC_PW=password ubuntu-desktop:20.04-chrome-102`
* `alanway/ubuntu-desktop:20.04-chrome-104`
  * 启动示例脚本: `docker run --rm -it --shm-size=512m -p 6901:6901 -e VNC_UN=ubuntu -e VNC_PW=password ubuntu-desktop:20.04-chrome-104`
* `alanway/ubuntu-desktop:22.04-chrome-90`
  * 启动示例脚本: `docker run --rm -it --shm-size=512m -p 6901:6901 -e VNC_UN=ubuntu -e VNC_PW=password ubuntu-desktop:22.04-chrome-90`
* `alanway/ubuntu-desktop:22.04-chrome-102`
  * 启动示例脚本: `docker run --rm -it --shm-size=512m -p 6901:6901 -e VNC_UN=ubuntu -e VNC_PW=password ubuntu-desktop:22.04-chrome-102`
* `alanway/ubuntu-desktop:22.04-chrome-104`
  * 启动示例脚本: `docker run --rm -it --shm-size=512m -p 6901:6901 -e VNC_UN=ubuntu -e VNC_PW=password ubuntu-desktop:22.04-chrome-104`

> 对应阿里云镜像, 把 `alanway/` 替换成 `registry.cn-hangzhou.aliyuncs.com/alanwei/` 即可.
## Desktop

### 使用

```bash
docker run --rm -it --shm-size=512m -p 6901:6901 -e VNC_UN=ubuntu -e VNC_PW=password alanway/ubuntu-desktop:20.04

# 国内用户可以使用阿里云镜像
docker run --rm -it --shm-size=512m -p 6901:6901 -e VNC_UN=ubuntu -e VNC_PW=password registry.cn-hangzhou.aliyuncs.com/alanwei/ubuntu-desktop:20.04
```

然后使用浏览器访问 `http://localhost:6901`, 账号密码是 `ubuntu` 和 `password`(通过环境变量 `VNC_UN` 和 `VNC_PW` 修改默认账号密码).

## Chrome

使用容器创建 Chrome 浏览器.

### 使用

```bash
docker run --rm -it --shm-size=512m -p 6901:6901 -e VNC_UN=ubuntu -e VNC_PW=password alanway/ubuntu-desktop:20.04-chrome-90

# 国内用户可以使用阿里云镜像
docker run --rm -it --shm-size=512m -p 6901:6901 -e VNC_UN=ubuntu -e VNC_PW=password registry.cn-hangzhou.aliyuncs.com/alanwei/ubuntu-desktop:20.04-chrome-86
```

然后使用浏览器访问 `http://localhost:6901`, 账号密码是 `ubuntu` 和 `password`(通过环境变量 `VNC_UN` 和 `VNC_PW` 修改默认账号密码).



### 新增新的Chrome版本

假设新增 Chrome v110 版本, 将Chrome安装包保存到 `softwares/chrome/chrome-110.deb` (*注意文件名格式*), 然后执行以下脚本:

```bash
./docker-cli/chrome-build.sh 22.04 110 && \
docker push alanway/ubuntu-desktop:22.04-chrome-110 && \
docker push "registry.cn-hangzhou.aliyuncs.com/alanwei/ubuntu-desktop:22.04-chrome-110"
```

> 注意需要提前执行 `docker login` 登陆官方镜像, 和执行 `docker login --username=your_aliyun_account registry.cn-hangzhou.aliyuncs.com` 登陆阿里云镜像
