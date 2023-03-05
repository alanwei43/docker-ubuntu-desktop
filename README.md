# Ubuntu desktop in Docker

本项目来源于 [kasmtech/workspaces-images](https://github.com/kasmtech/workspaces-images)

## Chrome

使用容器创建 Chrome 浏览器.

### 使用

```bash
docker run --rm -it --shm-size=512m -p 6901:6901 -e VNC_UN=ubuntu -e VNC_PW=password alanway/ubuntu-desktop:chrome-89

# 国内用户可以使用阿里云镜像
docker run --rm -it --shm-size=512m -p 6901:6901 -e VNC_UN=ubuntu -e VNC_PW=password registry.cn-hangzhou.aliyuncs.com/alanwei/ubuntu-desktop:chrome-89
```

然后使用浏览器访问 `https://localhost:6901`, 账号密码是 `ubuntu` 和 `password`(通过环境变量 `VNC_UN` 和 `VNC_PW` 修改默认账号密码).

已有[浏览器版本标签](https://hub.docker.com/r/alanway/ubuntu-desktop/tags)列表:

* `alanway/ubuntu-desktop:chrome-102`
* `alanway/ubuntu-desktop:chrome-104`
* `alanway/ubuntu-desktop:chrome-69`
* `alanway/ubuntu-desktop:chrome-79`
* `alanway/ubuntu-desktop:chrome-80`
* `alanway/ubuntu-desktop:chrome-83`
* `alanway/ubuntu-desktop:chrome-86`
* `alanway/ubuntu-desktop:chrome-90`

> 对应阿里云镜像, 把 `alanway/` 替换成 `registry.cn-hangzhou.aliyuncs.com/alanwei/` 即可.


### 新增新的Chrome版本

假设新增 Chrome v110 版本, 将Chrome安装包保存到 `softwares/chrome/chrome-110.deb` (*注意文件名格式*), 然后执行脚本 `docker-cli/chrome-build-push.sh 110` 即可.

> 注意需要提前执行 `docker login` 登陆官方镜像, 和执行 `docker login --username=your_aliyun_account registry.cn-hangzhou.aliyuncs.com` 登陆阿里云镜像