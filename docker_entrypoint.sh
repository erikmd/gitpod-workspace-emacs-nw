#!/bin/bash
# Author: Erik Martin-Dorel, 2023

set -eux

# This is (Docker-Coq, Gitpod) specific:
coq_uid_gid=1000
gitpod_uid_gid=33333

# Initially (takes between 1' and 2'):
# sudo find /home/coq -xdev -user "$coq_uid_gid" -exec chown -h "$gitpod_uid_gid" {} \;
# sudo find /home/coq -xdev -group "$coq_uid_gid" -exec chgrp -h "$gitpod_uid_gid" {} \;

# Assuming UID=GID for /home/coq, we can be faster:
sudo find /home/coq -xdev \( -user "$coq_uid_gid" -o -group "$coq_uid_gid" \) -exec chown -h "$gitpod_uid_gid:$gitpod_uid_gid" {} \;

exec "$@"
