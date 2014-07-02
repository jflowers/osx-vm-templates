#!/bin/bash

# http://www.opscode.com/chef/install
curl -L https://nexus.vistacore.us/repositories/filerepo/com/opscode/osx-chef-client/10.14.4/osx-chef-client-10.14.4.sh | bash

# Force exiting zero because the installer doesn't yet recognize 10.9 as
# a valid install target
exit 0
