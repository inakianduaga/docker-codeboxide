#!/bin/bash

# Add optional ssh keys
/scripts/add_ssh_keys.sh

#Run processes through supervisor
exec supervisord
