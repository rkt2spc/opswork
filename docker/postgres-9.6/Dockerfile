# postgres base
FROM postgres:9.6

# copy config file - better to use chef/puppet/ansible/consul
COPY mongod.conf /etc/

# RUN
CMD mongod --config /etc/mongod.conf