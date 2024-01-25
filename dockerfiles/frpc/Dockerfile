
FROM alpine AS runner
WORKDIR /app

ARG version=0.53.2
ENV VERSION=${version}

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
  && apk update --no-cache \
  && apk upgrade --no-cache \
  && wget https://github.com/fatedier/frp/releases/download/v${VERSION}/frp_${VERSION}_linux_amd64.tar.gz \
  && tar zxvf frp_${VERSION}_linux_amd64.tar.gz \
  && mv frp_${VERSION}_linux_amd64/* . \
  && rm -rf frp_${VERSION}_linux_amd64/ \
  && rm -rf frp_${VERSION}_linux_amd64.tar.gz

# ENTRYPOINT [ "/bin/sh" ]
CMD [ "./frpc", "-c", "frpc.toml" ]
