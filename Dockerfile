FROM alpine:3.21
RUN apk add --no-cache \
  openssh-client \
  ca-certificates \
  bash \
  git

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash"]
