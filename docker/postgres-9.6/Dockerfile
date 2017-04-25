# postgres base
FROM postgres:9.6

# copy config file - better to use chef/puppet/ansible/consul
COPY postgresql.conf /etc/

# RUN
CMD postgres -c config_file=/etc/postgresql.conf