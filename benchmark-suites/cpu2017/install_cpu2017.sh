#!/bin/bash

function usage {
	cat <<EOM
Usage: $(basename "$0") [iso path]
EOM
	exit 2
}

if [ $# -eq 0 ]
then
  usage
fi

iso_path=$1

echo "iso path: ${iso_path}"
echo "mnt path: ${mnt_path}"

if [ ! -f ${iso_path} ]; then
  echo "${iso_path} does not exits."
  exit 2
fi

sudo mount -t iso9660 -o ro,exec,loop  ${iso_path} /mnt
cd /mnt
./install.sh
cd -
sudo umount /mnt
