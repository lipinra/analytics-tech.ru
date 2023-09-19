#!/bin/bash
# архивируем с указанимем даты в названии файла
tar -czvf /root/metabase/backup/backup_`date +%Y-%m-%d"_"%H_%M_%S`.tar /root/metabase/pgadmin-data /root/metabase/nginx /etc/letsencrypt /root/metabase/docker-compose.yml /root/metabase/db_password.txt /root/metabase/db_user.txt
# бекапим postgres
docker-compose --file /root/metabase/docker-compose.yml run postgres pg_dumpall -c -U postgres > /root/metabase/backup/dump_`date +%Y-%m-%d"_"%H_%M_%S`.sql
# удаляем все файлы старше 7 дней
find /root/metabase/backup/ -type f -mtime +7 -delete

