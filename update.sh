#!/bin/sh

test -f ./builder/cbase16.cpp || git clone https://github.com/base16-fork/cbase16 ./builder
make -C ./builder

for f in $(find ./schemes -maxdepth 2 -type f -name "*.yaml"); do 
	if [ ! -d "$(dirname "$(echo $f | sed "s/\.\/schemes/\./")")" ]; then
		mkdir "$(dirname "$(echo $f | sed "s/\.\/schemes/\./")")"
	fi

	cp $f "$(echo $f | sed "s/\.\/schemes/\./")"
done
