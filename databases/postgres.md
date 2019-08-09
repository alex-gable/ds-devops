
#Postgres Ubuntu setup

Set environment variable POSTGERS_USER

```
sudo apt update
sudo apt install postgresql postgresql-contrib

Postgres uses a concept called "roles" to handle in authentication and authorization. These are, in some ways, similar to regular Unix-style accounts, but Postgres does not distinguish between users and groups and instead prefers the more flexible term "role".

sudo -i -u postgres
--to exit
\q

createuser --interactive
createdb testdb

DROP ROLE $POSTGERS_USER;

CREATE ROLE  $POSTGERS_USER WITH LOGIN PASSWORD 'pass2';

sudo -u $POSTGERS_USER psql -d testdb
```
