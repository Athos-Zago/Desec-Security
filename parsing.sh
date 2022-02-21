#!/bin/bash
if [ "$1" == "" ]
then
        echo "Está ferremneta é utilizada para bucar hosts em um domínio"
        echo "Modo de uso: $0 DNS"
        echo "Exemplo: $0 www.exemplo.com.br "
else
        wget $1
        cat index.html | grep "href" | cut -d "/" -f 3 | grep "\." | grep -v "<l" | cut -d '"' -f 1 > lista
        echo -e "\033[01;31mBuscando hosts \033[m"
        sleep 2
        for dns in $(cat lista);
        do
        host $dns | grep "has address"
        done
        rm -rf index.html
        rm -rf lista
fi
