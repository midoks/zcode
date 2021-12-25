#!/bin/sh

#load all 
softList=`ls /usr/local/Cellar/`
for i in $softList; do
	newest=`ls /usr/local/Cellar/$i |cut -d \  -f 1 | awk 'END {print}'`
	pconfig=/usr/local/Cellar/$i/$newest/lib/pkgconfig
	PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$pconfig
done
# echo $softList

# export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/Cellar/gtk4/4.4.0/lib/pkgconfig
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/opt/X11/lib/pkgconfig

# gcc -o hello hello.c `pkg-config --cflags --libs gtk4`

#g4=`pkg-config --libs --cflags gtk4`
#echo $g4


# clang `pkg-config --libs --cflags gtk4` -O3 -g0  -o hello hello.c


gcc -o hello hello.c `pkg-config --cflags --libs gtk4`