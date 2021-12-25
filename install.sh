#!/bin/sh


PATH=$PATH:/usr/local/Cellar/gtk4/4.4.0/lib/pkgconfig/gtk4.pc


#load all 
softList=`ls /usr/local/Cellar/`
for i in $softList; do
	newest=`ls /usr/local/Cellar/$i |cut -d \  -f 1 | awk 'END {print}'`
	pconfig=/usr/local/Cellar/$i/$newest/lib/pkgconfig
	PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$pconfig
done
# echo $softList


# PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/Cellar/harfbuzz/3.0.0/lib/pkgconfig
# PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/Cellar/pango/1.48.10/lib/pkgconfig
# PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/Cellar/libepoxy/1.5.9/lib/pkgconfig
# PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/Cellar/graphene/1.10.6/lib/pkgconfig
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/Cellar/gtk4/4.4.0/lib/pkgconfig

gcc -o hello hello.c `pkg-config --cflags --libs gtk4`