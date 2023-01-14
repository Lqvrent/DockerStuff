# Azuriom Bundle (Compose)
This Docker Compose file runs an Azuriom server and a PostgreSQL database.<br />

## 🔗 Quick reference
- Maintained by: <br />
[@Lqvrent](https://github.com/Lqvrent)
- Source code: <br />
[Azuriom-Bundle](https://github.com/Lqvrent/DockerStuff/tree/main/Azuriom-Bundle)
- Where to get help: <br />
[GitHub Issues](https://github.com/Lqvrent/DockerStuff/issues)

## 🤔 What is Azuriom ?
Azuriom is a free and open-source game server manager. It allows you to create a website to manage your game servers, and to create a community around them.<br />
For more information, see [Azuriom's website](https://azuriom.com/).

## ⚙️ Configuration - Docker Compose
You can configure the Azuriom server by editing the `docker-compose.yml` file.<br />
To change the database credentials, edit the `POSTGRES_USER`, `POSTGRES_PASSWORD` and `POSTGRES_DB` environment variables.<br />
By default, they are set to `root`, `123456` and `azuriom` respectively.<br /><br />
If you want to use apache or nginx, you can change the `lqvrent/azuriom-apache:latest` by `lqvrent/azuriom-nginx:latest` and vice versa.<br /><br />
If you want to edit on the fly Azuriom's files or the database, you can change the `volumes` section to `./azuriom:/var/www/azuriom` and `./postgres:/var/lib/postgresql/data` respectively. This will cause the website being more slow. See the *note* section in the usage if you got a problem in runtime.<br />

## ⚙️ Configuration - Azuriom installation
When you first start the Azuriom server, you will be asked to install Azuriom.<br />
When arriving on the database configuration page, you MUST use the following values:
- **Type:** `PostgreSQL`
- **Host:** `postgres` (this is the name of the database container)
- **Port:** `5432`
- **Database:** `azuriom` (or the value of the `POSTGRES_DB` environment variable
- **Username:** `root` (or the value of the `POSTGRES_USER` environment variable)
- **Password:** `123456` (or the value of the `POSTGRES_PASSWORD` environment variable)

## 🚀 Usage
To start the Azuriom server, run the following command:
```bash
docker-compose up -d
```
If you want to stop the Azuriom server, run the following command:
```bash
docker-compose down
```
**Note:** Sometimes, with mounted volumes, the permissions of the files are not correct.<br />
To fix this, you can run the following command:
```bash
docker exec -it Azuriom chmod -R 755 /var/www/azuriom && \
docker exec -it Azuriom chown -R www-data:www-data /var/www/azuriom
```
Also, if mounting the database, you may need to run the following command:
```bash
docker exec -it Azuriom chown -R postgres:postgres /var/lib/postgresql/data
```
And if mounting the Azuriom files, you may see they are not appearing in the container.<br />
To fix this, you can manually re-install Azuriom by running the following command:
```bash
docker exec -it Azuriom unzip /tmp/AzuriomInstaller.zip -d /var/www/azuriom && \
docker exec -it Azuriom chmod -R 755 /var/www/azuriom && \
docker exec -it Azuriom chown -R www-data:www-data /var/www/azuriom
```

## 📝 Notes
- This compose file is NOT meant to be used in production, it is only for testing purposes.
- This compose file was tested with PHP 8.0, Apache 2.4/Nginx 1.18 and Azuriom v1.0.12, more recent versions may work but are not guaranteed to work.
