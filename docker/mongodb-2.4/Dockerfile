# mongo base
FROM mongo:2.4

# copy config file - better to use chef/puppet/ansible/consul
COPY mongod.conf /etc/

# RUN
CMD mongod --config /etc/mongod.conf