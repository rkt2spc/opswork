# Guidance
mongodump, mongorestore: dump and restore data with same schema
mongoexport, mongoimport: take a part of data from one database and import them to another

# References: mongodump
mongodump \
  [-h|--host] <hostname><:port>
  [--port] # not needed if already provided in --host option, default to 27017
  [-u|--username]
  [-p|--password]
  [--authenticationDatabase] # default to exporting db if not provided
  [-d|--db]
  [-c|--collection]
  [-q|--query]
  [-o|--out]

Sample Usage:
  mongodump \
    -h localhost:27017 \
    -u admin -p 123456 --authenticationDatabase admin \
    -d cool_app_db \
    -c profiles \
    -o ~/dump

# References: mongorestore
mongorestore \
  [-h|--host] <hostname><:port>
  [--port] # not needed if already provided in --host option, default to 27017
  [-u|--username]
  [-p|--password]
  [--authenticationDatabase] # default to exporting db if not provided
  [-d|--db]
  [-c|--collection]
  <path> # directory contain dump data

Sample Usage:
  mongorestore \
    -h localhost:27017
    -u admin -p 123456 --authenticationDatabase admin \
    -d cool_app_db \
    -c profiles \
    ~/dump