docker build -t ubuntu-desktop:chrome ./ && \
docker run --rm -it \
  --shm-size=512m \
  -p 6901:6901 \
  -p 6910:6910 \
ubuntu-desktop:chrome