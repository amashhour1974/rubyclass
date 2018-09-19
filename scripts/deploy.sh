#!/bin/sh

################################################################################
set -e
set -u

################################################################################
ssh_host="ursula.pmade.com"
ssh_dir="/var/lib/websites/devalot.com/shared/files/rubyclass"

################################################################################
short_name=$(basename "$ssh_dir").zip
link_file=result/$short_name

################################################################################
if [ ! -e "$link_file" ]; then
  >&2 echo "run nix-build to generate $link_file"
  exit
fi

################################################################################
zip_file=$(realpath "$link_file")
long_name=$(basename "$zip_file")

################################################################################
scp "$zip_file" "${ssh_host}:${ssh_dir}"
ssh "$ssh_host" "cd $ssh_dir && ln -nfs $long_name $short_name"
