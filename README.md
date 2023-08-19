# Keydb JSON Search 

KeyDB image with Redis Json and Redis Search.

## Versions
|Component|Version|Reason|
|-|-|-|
|KeyDB| main branch|Released KeyDB iamges are based on Ubuntu 18.04, while main branch is based on Ubuntu 20.04|
|Redis Search|v2.6.3|Minimal Redis/KeyDB Support 6.x.x, later versions don't work|
|Redis JSON |v2.4.2|Minimal Redis//KeyDB Support 6.x.x, later versions don't work|

## Docker 
Images available at [Dockerhub](https://hub.docker.com/u/vsaps)

Run using docker 
```bash
docker run vsaps/keydb_jsonsearch
```


## Points
* KeyDB general releases are based on Ubuntu 18.04, which are not supported by newer releases of Redis JSON and Redis Search. So this image is built using the main branch for now.
* KeyDB crashes on startup while loading redisearch module. This happens when either using `CMD [ "--loadmodule", "/etc/libs/redisearch.so" ]` OR specifying load-module in config file
* Modules are loaded lazily, which does not seem to cause any issue (yet).










