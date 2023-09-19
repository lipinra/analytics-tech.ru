# Установка Metabase  с использованием Docker, Nginx, Postgresql, Pgadmin.

При установке/переустановке системы необходимо указать публичный ssh ключ, текущий размещен в файле .ssh/analytics-tech.ru.pub

При необходимости можно провести генерацию нового ключа:
``` bash
ssh-keygen -t ed25519 -f ~/.ssh/analytics-tech.ru
```

Данная конфигурация тестировалась на операционной системе Ubuntu 20.04.

После установки операционной системы необходимо произвести начальную настройку с использованием ansible:
``` bash
ansible-playbook main.yml
```

В случае необходимости ручной донастройки подключение по ssh:
``` bash
ssh -i '~/analytics-tech.ru/.ssh/analytics-tech.ru' root@analytics-tech.ru
```

После установки доступ к ресурсу проходит по адресу:

https://analytics-tech.ru/

Доступ к pgadmin:

http://analytics-tech.ru/pgadmin

- логин: metabase@lipinr.ru
- пароль: указан в файле template/pgadmin_password.txt

Подключение к postgresql из pgadmin:
- хост: postgres
- логин: указан в файле template/db_user.txt
- пароль: указан в файле template/db_password.txt

В случае необходимости восстановления баз postgresql из бекапа:
``` bash
cat /root/metabase/backup/your_dump.sql | docker exec -i postgres psql -U postgres
```
