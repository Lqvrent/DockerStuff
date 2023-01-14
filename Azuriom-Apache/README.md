# Azuriom Apache
This Docker image runs an Azuriom server with PHP 8.1 and Apache 2.4.

## 🤔 What is Azuriom ?
Azuriom is a free and open-source game server manager. It allows you to create a website to manage your game servers, and to create a community around them.<br />
For more information, see [Azuriom's website](https://azuriom.com/).

## 🚀 Usage
Monting a volume is required to store the Azuriom files.<br />
Here, we are mounting a volume named `azuriom-data` (don't forget to replace `AZURIOM_TAG` with the desired version).
```bash
docker run -d \
    -p 80:80 \
    -v azuriom-data:/var/www/azuriom \
    --name azuriom \
    lqvrent/azuriom-apache:AZURIOM_TAG
```
**Note:** Sometimes, with mounted volumes, the permissions of the files are not correct.<br />
To fix this, you can run the following command:
```bash
docker exec -it azuriom chmod -R 755 /var/www/azuriom && \
docker exec -it azuriom chown -R www-data:www-data /var/www/azuriom
```

## 📦 Build
The Dockerfile takes the `AZURIOM_TAG` argument, representing a tag from the [Azuriom repository](https://github.com/Azuriom/AzuriomInstaller/tags).<br />
You can't use the value `latest` as it is not a valid tag.<br />
The default value is `v1.1.0` (The latest version at the time of writing this README).
```bash
docker build --build-arg AZURIOM_TAG=v1.1.0 -t azuriom-apache .
```

## 📝 Notes
- This image is NOT meant to be used in production, it is only for testing purposes.
- This image was tested with PHP 8.1, Apache 2.4 and Azuriom v1.1.0, more recent versions may work but are not guaranteed to work.
- This image does NOT include a database. You will need to provide one yourself (or use the [bundle](/Azuriom-Bundle)).
