# Dockerfile с nginx

## Задачи:

Собрать образ с nginx без применения официального nginx-образа

Оптимизировать размер созданного образа

## Команды

docker build -t nginx_image .

docker container run -it --rm -d -p 8082:80 nginx_image

## Результат

```
REPOSITORY     TAG       IMAGE ID        CREATED           SIZE
nginx_image    latest    9d2cecc79958    12 minutes ago    15.9MB
```

## Технологии

![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)
