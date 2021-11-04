# pg_restore — restore a PostgreSQL database from an archive file created by pg_dump
{:data-section="shell"}
{:data-date="October 27, 2021"}
{:data-extra="Um Pages"}

## EXAMPLES

`pg_restore -U user -h localhost --clean -d database_name < file.sql`
: Restore contents of `file.sql` to database `database_name` in `localhost`
