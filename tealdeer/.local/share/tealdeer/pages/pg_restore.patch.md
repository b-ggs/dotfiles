- Restore (compressed) `filename.dump` to database `database_name` on `localhost`:

`pg_restore -h localhost -U user -d database_name -v --clean filename.dump`

- Restore (compressed) `filename.dump` to the database specified by `$DATABASE_URL`:

`pg_restore $DATABASE_URL -v --clean filename.dump`
