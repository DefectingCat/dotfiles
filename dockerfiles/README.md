Build and test

```shell
docker build --progress=plain -t ubuntu-dev -f dockerfiles/ubuntu/Dockerfile . && docker run --rm -it ubuntu-dev
```
