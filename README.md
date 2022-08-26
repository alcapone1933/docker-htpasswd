# Docker Htpasswd Generator bcrypt

### Docker CLI

```bash
docker run -it --rm \
  -e USER_NAME=admin \
  -e USER_PASSWD=admin \
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
    volumes:
      - data:/data
volumes:
  data:
    name: htpasswd_data
```
* * *

## Volume params

| Name   |Value    |Example      |
|--------|---------|-------------|
|  Data  | volume  | data:/data  |

* * *

## Env params


| Name     | Value        | Example     |
|----------|--------------|-------------|
| USER     | USER_NAME    | admin       |
| PASSWORD | USER_PASSWD  | admin       |
