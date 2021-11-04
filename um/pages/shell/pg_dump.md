# pg_dump — extract a PostgreSQL database into a script file or other archive file
{:data-section="shell"}
{:data-date="October 27, 2021"}
{:data-extra="Um Pages"}

## EXAMPLES

`pg_dump -U user -h localhost -Fc database_name > file.sql`
: Dump database `database_name` in `localhost` to `file.sql`.
