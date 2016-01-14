# BUILD

```
docker build -t docker-carbon .
```


# RUN

```
docker run -it -d -p 2003:2003 -p 2004:2004 -p 7002:7002 -v /tmp/graphite:/opt/graphite/storage/whisper --name carbon docker-carbon
```
