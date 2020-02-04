# instructions

# assumptions

- the schema is available localy and the database too

# dump
`
    pg_dump -Z6--dbname=postgresql://postgres:@127.0.0.1:5432/luca_test_dump --data-only >dump_restore.gz
`
# restore
`
    zcat dump_restore.gz | psql -U postgres -d luca_test_dump
`
