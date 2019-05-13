## Dockerfile文件

```base.Dockerfile```

## path

```shell
$ docker pull registry.cn-shenzhen.aliyuncs.com/tsinghua_gd/jupyter:base
```

## build
```shell
sudo nvidia-docker run -it \
    -p 8001:8888 \
    --name=aaron_jupyter \
    -v /home/aaron:/aaron \
    -v /data:/data \
    -w / \
    registry.cn-shenzhen.aliyuncs.com/tsinghua_gd/jupyter:base \
    /bin/bash
```    
* -p: 端口映射
* -v: 挂载目录
* -w: 工作目录
```shell
# 生成 jupyter 配置文件
$ jupyter notebook --generate-config --allow-root
# 设置密码
$ jupyter notebook password
# 启动jupyter
$ nohup jupyter notebook --ip 0.0.0.0 --allow-root 2>&1 &
```
```ctrl + P```+```ctrl + Q```不终止容器退出

### docker 安装
```shell
# 安装 docker
$ wget -qO- https://get.docker.com/ | sh
# 启动 docker 后台
$ sudo service docker start
# test
$ sudo docker run hello-world
```

### nvidia-docker 安装
```shell
# If you have nvidia-docker 1.0 installed: we need to remove it and all existing GPU containers
docker volume ls -q -f driver=nvidia-docker | xargs -r -I{} -n1 docker ps -q -a -f volume={} | xargs -r docker rm -f
sudo apt-get purge -y nvidia-docker

# Add the package repositories
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | \
  sudo apt-key add -
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | \
  sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt-get update

# Install nvidia-docker2 and reload the Docker daemon configuration
sudo apt-get install -y nvidia-docker2
sudo pkill -SIGHUP dockerd

# Test nvidia-smi with the latest official CUDA image
docker run --runtime=nvidia --rm nvidia/cuda:9.0-base nvidia-smi
```

## test
* opencv
  ```python
  import cv2
  ```

* torch
  ```python
  import torch
  torch.cuda.is_available()
  ```
