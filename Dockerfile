FROM --platform=${TARGETPLATFORM} golang:alpine as builder
ARG CGO_ENABLED=0
ARG TAG
ARG REPOSITORY

WORKDIR /root
RUN apk add --update git \
	&& git clone https://github.com/${REPOSITORY} mosdns \
	&& cd ./mosdns \
	&& git fetch --all --tags \
	&& git checkout tags/${TAG} \
	&& go build -ldflags "-s -w -X main.version=${TAG}" -trimpath -o mosdns

FROM --platform=${TARGETPLATFORM} alpine:latest
LABEL maintainer="fordes123 <github.com/fordes123>"

ENV TZ=Asia/Shanghai \
    CRON="0 0 */7 * *"

USER root
WORKDIR /etc/mosdns
COPY --from=builder /root/mosdns/mosdns /usr/bin/
COPY scripts /scripts
COPY config/* /etc/mosdns/

RUN apk add --no-cache ca-certificates wget dcron tzdata \
	&& chmod a+x /scripts/* \
    && /scripts/update.sh

VOLUME /etc/mosdns
EXPOSE 53/udp 53/tcp
ENTRYPOINT [ "/scripts/entrypoint.sh" ]