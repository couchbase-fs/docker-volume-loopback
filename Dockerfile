# build
FROM golang:1.11-alpine as builder
RUN apk --no-cache add make
ADD ./ /go/src/github.com/ashald/docker-volume-loopback/
WORKDIR /go/src/github.com/ashald/docker-volume-loopback
RUN make build && \
    mv ./docker-volume-loopback /


# package
FROM alpine
RUN apk --no-cache add \
    # fs detection
    file \
    # ext4
    e2fsprogs \
    # xfs
    xfsprogs util-linux \
    # terminfo files are shipped with 'util-linux' and are hardlinks - that breaks docker export tar
    && rm -rf /usr/share/terminfo \
    && rm -rf /etc/terminfo

COPY --from=builder /docker-volume-loopback /
CMD [ "/docker-volume-loopback" ]
