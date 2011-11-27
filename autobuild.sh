#!/bin/bash

functionshutdown()
{
	echo "function to shutdown system"
	sleep 180
	cmd //c shutdown.exe -s
	# wait after shutdown command too, since it not directly shuts down but waits a minute or such
	sleep 180
}


sleep 30

latestcommit=$(git describe)
git fetch origin
git reset --hard origin/master
commitnow=$(git describe)

if [ "$latestcommit" == "$commitnow" ] ; then
	echo "Nothing to be done, shutting down now!"
	functionshutdown
fi

echo "building tiled"
qmake.exe ${USERPROFILE}/tiled/tiled.pro "QMAKE_CXXFLAGS+=-DBUILD_INFO_VERSION=${commitnow}" -r -spec win32-g++ "CONFIG+=release"
mingw32-make.exe

cd dist
cd win

DATESTRING=$(date -I)
echo "set VERSION=${DATESTRING}" > version.bat

cmd //c	setandbuild32.bat
EXENAME="tiled-${DATESTRING}-win32-setup.exe"
cmd //c move $EXENAME E:\

rm version.bat
# win
cd ..
# dist
cd ..
# now in tiled again
mingw32-make.exe clean

functionshutdown