# Remove all container
docker rm $(docker ps -a -q)

# Remove all exited container
docker rm $(docker ps --filter "status=exited")


# References on docker ps filter 
# https://github.com/moby/moby/blob/master/docs/reference/commandline/ps.md
docker ps \
  [-f| --filter] value  Filter output based on conditions provided (default [])
                        - ancestor=(<image-name>[:tag]|<image-id>|<image@digest>)
                          containers created from an image or a descendant.
                        - before=(<container-name>|<container-id>)
                        - expose=(<port>[/<proto>]|<startport-endport>/[<proto>])
                        - exited=<int> an exit code of <int>
                        - health=(starting|healthy|unhealthy|none)
                        - id=<ID> a container's ID
                        - isolation=(`default`|`process`|`hyperv`) (Windows daemon only)
                        - is-task=(true|false)
                        - label=<key> or label=<key>=<value>
                        - name=<string> a container's name
                        - network=(<network-id>|<network-name>)
                        - publish=(<port>[/<proto>]|<startport-endport>/[<proto>])
                        - since=(<container-name>|<container-id>)
                        - status=(created|restarting|removing|running|paused|exited) 
                        - volume=(<volume name>|<mount point destination>)