# pg_dump — extract a PostgreSQL database into a script file or other archive file
{:data-section="shell"}
{:data-date="October 27, 2021"}
{:data-extra="Um Pages"}

## EXAMPLES

`pg_dump -h localhost -U user -d database_name -Fc -f filename.dump`
: Dump database `database_name` in `localhost` to `filename.dump` (compressed)

`pg_dump $DATABASE_URL -Fc -f filename.dump`
: Dump database specified by `DATABASE_URL` environment variable to `filename.dump` (compressed)
