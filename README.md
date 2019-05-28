## Build Image
```bash
docker build -t gfw-dnsmasq ./
```

## Deploy

### Macvaln
```bash
 docker run --restart always --name dnsmasq -d -it --net=physical --ip=192.168.1.21 -v /home/jerry/DockerImageOfDNSMasqWithGFWList/dnsmasq.d:/etc/dnsmasq.d -e "GFW_DNS=8.8.4.4" --cap-add=NET_ADMIN gfw-dnsmasq
```