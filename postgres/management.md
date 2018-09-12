# Postgres management note (on AWS RDS)

- Never use the default master user for CRUD usage, always create a service role
- Never use default_database parameter of RDS, leave it blank, because it is useless and misleading
- Adjust correct privileges
    - Do this right after creating the database
    - Modify default privileges for intended service role (on the database level so default privileges for PUBLIC role are removed) before running the initial migrations
    - Make sure the service role only get the privileges it needs (Check [here](https://www.postgresql.org/docs/9.4/static/sql-grant.html))
    - Only the root role (RDS master user) is allowed to run migrations
