```
helm upgrade --install -n dns powerdns . -f values.yaml --set powerdns.apikey=xxx --set powerdnsadmin.mysql_pass=xxx --set powerdns.mysql_rootpass=xxx --set mariadb.mysql_pass=xxx
```