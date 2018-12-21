# Cloud Sql Proxy demo for now.sh

Follow https://cloud.google.com/sql/docs/postgres/sql-proxy for generating credentials file, the quide refers to it as `creds.json`

Add the credentials file as a secret to now:
```bash
now secrets add cloudproxy "$(cat creds.json | base64)"
```


### Deploy:

```
now --docker -e cloudproxy=@cloudproxy -e USER=<user for the psql> -e PASSWORD=<password for the psql>
```
