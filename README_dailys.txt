README for the daily builds of tiled:

As a user:
==========
Usually these builds are stable, but between releases sometimes the 
userinterface (e. g. icons) are lacking its elegance
So grab the latest version provided in this directory and install it.

If you are experienceing problems, please report these 
either at https://github.com/bjorn/tiled/issues or via 
IRC at http://webchat.freenode.net/?channels=tiled
Please include the version number as provided in the about dialog with
the bugreport.


As a developer:
===============
The scripts autobuild.sh and setandbuild32.bat can generate daily builds of
tiled.

Needed Software: QtSDK, msysgit, NSIS

Clone tiled so that ${USERPROFILE}/tiled is the root directory of tiled.
Put autobuild.sh into the root directory ${USERPROFILE}/tiled ,
setandbuild32.bat should be placed into ${USERPROFILE}/tiled/dist/win.

Adapt the following:
In setandbuild32.bat the paths of QT and MinGW must be set correctly.
In autobuild.sh the copydestination ("E:\") must be set correctly.
Make sure the locations of git, mingw32-make.exe and the right version of 
qmake.exe are in the %PATH% variable.
Also the NSIS package must be installed properly and the executables must be
in path also!

To generate a daily build, just call autobuild.sh

