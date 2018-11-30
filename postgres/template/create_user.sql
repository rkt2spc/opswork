CREATE ROLE {{ user }} WITH
    LOGIN
    INHERIT
    PASSWORD '{{ password }}'
    CONNECTION LIMIT 10
    IN ROLE {{ role }};
