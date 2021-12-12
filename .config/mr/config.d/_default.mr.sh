
# vim: syntax=sh ts=4 sw=4 sts=4 sr noet
#
# Filename: ~/.config/mr/config.d/_default.mr.sh
# NOTE: Add the following lines to ~/.mrconfig/
#[DEFAULT]
#include = cat ~/.config/mr/config.d/*

[DEFAULT]
jobs = 8

# Teach mr how to do X in git repos.
git_gc = git gc "$@"
git_gs = git status "$@"

# Teach mr how to do X in vcsh repos.
vcsh_gs = git status "$@"

