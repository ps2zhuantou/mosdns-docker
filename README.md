# mosdns-docker

Building a Mosdns Docker image with a full configuration and automatic updates for Geoip and GeoSite lists.

[https://hub.docker.com/r/fordes123/mosdns](https://hub.docker.com/r/fordes123/mosdns)

## Usage

#### docker-compose

```shell
services:
  mosdns:
    image: fordes123/mosdns:latest
    container_name: mosdns
    volumes:
      - /path/to/mosdns:/etc/mosdns
    environment:
      - TZ=Asia/Shanghai
      - CRON=0 0 */7 * *
    ports:
      - 53:53/tcp
      - 53:53/udp
    restart: unless-stopped
```

#### docker cli

```shell
docker run -d \
  --name mosdns \
  --restart unless-stopped \
  --env TZ=Asia/Shanghai \
  --env CRON='0 0 */7 * *' \
  -v /path/to/mosdns:/etc/mosdns \
  -p 53:53/tcp \
  -p 53:53/udp \
  fordes123/mosdns:latest
```

### Parameters

| Parameter	            | Function                               
|:----------------------|:---------------------------------------|
| `-p 53`               | DNS port.                              
| `-v /etc/mosdns`      | config path.                           
| `-e TZ=Asia/Shanghai` | server time zone                       
| `-e CRON=0 0 */7 * *` | auto update geoip rule cron expression 

---

### Acknowledgements

> this repository source code copy from [IrineSistiana/mosdns-docker](https://github.com/IrineSistiana/mosdns-docker)  
> config file reference from [mosdns community](https://github.com/IrineSistiana/mosdns/discussions)  
> geoip geosite lists source [17mon/china_ip_list](https://github.com/17mon/china_ip_list) and [Loyalsoldier/v2ray-rules-dat](https://github.com/Loyalsoldier/v2ray-rules-dat)
