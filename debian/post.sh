#!/bin/bash

DST_DIST="#@DST_DIST@#"

cat <<EOF >/tmp/python.version.py
import sys
print str(sys.version_info[0])+str(sys.version_info[1])
EOF
PYTHON_VER=`python /tmp/python.version.py`
if [ "${PYTHON_VER}" == "26"  ];then
    DST_DIR="/usr/local/lib/python2.6/dist-packages"
else
    DST_DIR="/usr/local/lib/python2.7/dist-packages"
fi
if [ ! -d "${DST_DIR}" ]; then
    echo "No python version found. Current Version:${PYTHON_VER}"
    exit 1
fi

rm -rf $DST_DIR/pyes*
mv /opt/pyes/pyes $DST_DIR
mv /opt/pyes/pyes*-info $DST_DIR

