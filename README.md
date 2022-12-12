# Docker Htpasswd Generator bcrypt,MD5,SHA1,CRYPT
[![Build Status](https://shields.cosanostra-cloud.de/drone/build/alcapone1933/docker-htpasswd?logo=drone&server=https%3A%2F%2Fdrone.docker-for-life.de)](https://drone.docker-for-life.de/alcapone1933/docker-htpasswd)
[![Build Status Branch Master](https://shields.cosanostra-cloud.de/drone/build/alcapone1933/docker-htpasswd/master?logo=drone&label=build%20%5Bbranch%20master%5D&server=https%3A%2F%2Fdrone.docker-for-life.de)](https://drone.docker-for-life.de/alcapone1933/docker-htpasswd/branches)
[![Docker Pulls](https://shields.cosanostra-cloud.de/docker/pulls/alcapone1933/htpasswd?logo=docker&logoColor=blue)](https://hub.docker.com/r/alcapone1933/htpasswd/tags)
![Docker Image Version (latest semver)](https://shields.cosanostra-cloud.de/docker/v/alcapone1933/htpasswd?sort=semver&logo=docker&logoColor=blue&label=dockerhub%20version)
### Docker CLI

```bash
docker run -it --rm \
  -e USER_NAME=admin \
  -e USER_PASSWD=admin \
  -e PASSWORD_FORMAT=bcrypt \
  -v htpasswd_data:/data \
  alcapone1933/htpasswd:latest
```

### Docker Compose

```yaml
version: "3.9"
services:
  htpasswd:
    image: alcapone1933/htpasswd:latest
    container_name: htpasswd
    environment:
      - USER_NAME=admin	
      - USER_PASSWD=admin
      - PASSWORD_FORMAT=bcrypt
    volumes:
      - data:/data
volumes:
  data:
    name: htpasswd_data
```
* * *

## Volume params

| Name      | Value   | Example            |
| --------- |-------- | ------------------ |
| Data      | volume  | data:/data         |
| File auth | path    | ./auth:/data/auth  |
* * *

## Env params


| Name                 | Value           | Default     | Example    | FORMAT                |
| -------------------- | --------------- | ----------- | ---------- | --------------------- |
| USER                 | USER_NAME       | admin       | admin      | --------------------- |
| PASSWORD             | USER_PASSWD     | admin       | admin      | --------------------- |
| PASSWORD             | USER_PASSWD     | admin       | admin      | --------------------- |
| PASSWORD Formats     | PASSWORD_FORMAT | bcrypt      | bcrypt     | bcrypt,MD5,SHA1,CRYPT |
| FILE auth #Optional  | FILE_AUTH       | /data/auth  | /data/auth | --------------------- |
