# pg_restore — restore a PostgreSQL database from an archive file created by pg_dump
{:data-section="shell"}
{:data-date="October 27, 2021"}
{:data-extra="Um Pages"}

## EXAMPLES

`pg_restore -h localhost -U user -d database_name -v --clean filename.dump`
: Restore (compressed) contents of `filename.dump` to database `database_name` in `localhost`
