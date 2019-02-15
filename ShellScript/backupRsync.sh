#!/bin/bash
# Backup automático de pastas utilizando compressão via rsync
# Versão 1.0 de 15/02/2019
# Fernando Ferreira Silva, ferreirasil.com

server_address="172.16.0.200"
path="/home/fernando/"
folder="Nextcloud"
date_name=$(date "+%Y%m%d")

tar -cjvf $folder\_$date_name.tar.bz2 $path$folder
