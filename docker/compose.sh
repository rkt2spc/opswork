# working with compose
docker-compose -f <compose-file> up [-d] [--build] [--force-recreate]
docker-compose -f <compose-file> down [--rmi=all] [-v]

# operation references
docker-compose -f <compose-file> build
docker-compose -f <compose-file> kill
docker-compose -f <compose-file> up|down
docker-compose -f <compose-file> start|stop|restart
docker-compose -f <compose-file> pause|unpause

# management references
docker-compose -f <compose-file> logs|port|ps|top
docker-compose -f <compose-file> scale
