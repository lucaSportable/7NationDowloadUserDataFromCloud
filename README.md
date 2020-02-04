## Save on the local

Saving the cloud to the local one.


## Requirements

- connection to rds. ( new need to be tested)
- pg dumper ( need to interface the existent to rds)
- sender remote receiver in metric server of the dump itself?
- pg restorer (total new piece of code)

## alternative plan

- trigger from the local
- creation of the tmp db in rds (remote)
- send a ready to download to the local instance
- local instance connect to rds, dump and restore.


## steps


#### Remote initializer
0. its an endpoint
0.1 connect to rds.
1. create a new database with only the selected fields.
2. dump it
3. send it (its just an api request)
3.a delete the local datab
4. restore the pg dump locally in receiver.




