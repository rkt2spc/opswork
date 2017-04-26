# Dump data
pg_dump \
  [-h|--host] <hostname>
  [-p|--port] <port>
  [-U|--username] <username>
  <database-name>
  > <dump-file>

Sample Usage:
  pg_dump -h localhost -p 5432 -U postgres management_firmware > ~/Data/dump/dumpfile

# Restore data
psql \
  [-h|--host] <hostname>
  [-p|--port] <port>
  [-U|--username] <username>
  <database-name>
  < <dump-file>

Sample usage:
  psql -h localhost -p 5432 -U postgres management_firmware < ~/Data/dump/dumpfile