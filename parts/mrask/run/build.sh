#!/bin/bash
set -euo pipefail
source /home/dale/Syncthing/Development/Tools/Ask_CMD/parts/mrask/run/environment.sh
set -x
cp --archive --link --no-dereference . "/home/dale/Syncthing/Development/Tools/Ask_CMD/parts/mrask/install"
