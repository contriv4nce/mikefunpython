#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
    DESTDIR_ARG="--root=$DESTDIR"
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/mike/code/mikefunpython/cws/src/rosserial/rosserial_xbee"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/mike/code/mikefunpython/cws/install/lib/python2.7/dist-packages:/home/mike/code/mikefunpython/cws/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/mike/code/mikefunpython/cws/build" \
    "/usr/bin/python" \
    "/home/mike/code/mikefunpython/cws/src/rosserial/rosserial_xbee/setup.py" \
    build --build-base "/home/mike/code/mikefunpython/cws/build/rosserial/rosserial_xbee" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/mike/code/mikefunpython/cws/install" --install-scripts="/home/mike/code/mikefunpython/cws/install/bin"
