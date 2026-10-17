- Dump database `database_name` on `localhost` to `filename.dump` (compressed):

`pg_dump -h localhost -U user -d database_name -Fc -f filename.dump`

- Dump the database specified by `$DATABASE_URL` to `filename.dump` (compressed):

`pg_dump $DATABASE_URL -Fc -f filename.dump`
