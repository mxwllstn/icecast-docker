# Icecast in Docker

Icecast2 Dockerfile

[![](http://dockeri.co/image/mxwllstn/icecast)](https://hub.docker.com/r/mxwllstn/icecast/)

## Build
```bash
docker build -t mxwllstn/icecast .
```

## Run

Run with default password, export port 8000

```bash
docker run -d --name icecast -p 8000:8000 mxwllstn/icecast
$BROWSER localhost:8000
```

Run with custom password

```bash
docker run -d --name icecast -p 8000:8000 -e ICECAST_SOURCE_PASSWORD=aaaa -e ICECAST_ADMIN_PASSWORD=bbbb -e ICECAST_PASSWORD=cccc -e ICECAST_RELAY_PASSWORD=dddd -e ICECAST_HOSTNAME=noise.example.com mxwllstn/icecast
```

Run with .env file
```bash
docker run -d --name icecast -p 8000:8000  --env-file ./.env mxwllstn/icecast

```

Run with custom configuration

```bash
docker run -p 8000:8000 -v /local/path/to/icecast/config:/etc/icecast2 mxwllstn/icecast
docker run -p 8000:8000 -v /local/path/to/icecast.xml:/etc/icecast2/icecast.xml mxwllstn/icecast
```

Extends Dockerfile

```Dockerfile
FROM mxwllstn/icecast
ADD ./icecast.xml /etc/icecast2
```

Docker compose

```yaml
icecast:
  image: mxwllstn/icecast
  environment:
  - ICECAST_SOURCE_PASSWORD=aaa
  - ICECAST_ADMIN_PASSWORD=bbb
  - ICECAST_PASSWORD=ccc
  - ICECAST_RELAY_PASSWORD=ddd
  - ICECAST_HOSTNAME=noise.example.com
  ports:
  - 8000:8000
```

Run with docker compose

```bash
docker compose up --detach
```

## License

[MIT](https://github.com/moul/docker-icecast/blob/master/LICENSE.md)
