#!/bin/sh

# Normal variable declaration, doesn't spin down to child process'
FOO=bar
sh -c 'echo $FOO' # Nothing

# Export syntax 1
FOO=bar
export FOO
sh -c 'echo $FOO' # bar

# Export syntax 2 - not available in old sh scripts
export FOO=bar
sh -c 'echo $FOO' # bar
