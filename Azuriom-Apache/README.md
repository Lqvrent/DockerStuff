# Azuriom Apache
This Docker image runs an Azuriom server with PHP 8.1 and Apache 2.4.<br />
Each tag represents a version of Azuriom, see [the tags](https://hub.docker.com/r/lqvrent/azuriom-apache/tags) for more information.

## 🔗 Quick reference
- Maintained by: <br />
[@Lqvrent](https://github.com/Lqvrent)
- Source code: <br />
[Azuriom-Apache](https://github.com/Lqvrent/DockerStuff/tree/main/Azuriom-Apache)
- Where to get help: <br />
[GitHub Issues](https://github.com/Lqvrent/DockerStuff/issues)

## 🤔 What is Azuriom ?
Azuriom is a free and open-source game server manager. It allows you to create a website to manage your game servers, and to create a community around them.<br />
For more information, see [Azuriom's website](https://azuriom.com/).

## 🚀 Usage
Monting a volume is required to store the Azuriom files.<br />
Here, we are mounting a volume named `azuriom-data` (don't forget to replace `AZURIOM_VERSION` with the desired version).
```bash
docker run -d \
    -p 80:80 \
    -v azuriom-data:/var/www/azuriom \
    --name azuriom \
    lqvrent/azuriom-apache:AZURIOM_VERSION
```
**Note:** Sometimes, with mounted volumes, the permissions of the files are not correct.<br />
To fix this, you can run the following command:
```bash
docker exec -it azuriom chmod -R 755 /var/www/azuriom && \
docker exec -it azuriom chown -R www-data:www-data /var/www/azuriom
```

## 📦 Build
To build this image, you can use the following command, assuming you are in the directory containing the Dockerfile:
```bash
docker build -t azuriom-apache:local .
```

## 📝 Notes
- This image is NOT meant to be used in production, it is only for testing purposes.
- This image was tested with PHP 8.1, Apache 2.4 and Azuriom v1.0.12, more recent versions may work but are not guaranteed to work.
- This image does NOT include a database. You will need to provide one yourself (or use the [bundle](/Azuriom-Bundle)).