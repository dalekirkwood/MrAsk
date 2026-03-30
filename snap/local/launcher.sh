#!/bin/bash
# Wrapper script for mrask snap
# Uses host system jq, curl, fzf

export PATH="/usr/bin:$PATH"
export LD_LIBRARY_PATH=""

exec "$@"
