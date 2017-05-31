# Remove all images
docker rmi $(docker images -q)

# Remove all 'dangling' images (overrided image)
docker rmi $(docker images -q --filter "dangling=true")

# References on docker images filter
docker images \
  [-f | --filter] value  Filter output based on conditions provided (default [])
                         - dangling=(true|false)
                         - label=<key> or label=<key>=<value>
                         - before=(<image-name>[:tag]|<image-id>|<image@digest>)
                         - since=(<image-name>[:tag]|<image-id>|<image@digest>)
                         - reference=(pattern of an image reference)