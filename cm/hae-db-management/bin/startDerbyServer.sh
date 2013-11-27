#!/bin/sh
#
#  Start the Derby SQL Server in Network Mode
#
#  Chris Purtell
#  November 20, 2011

BASEDIR=$(dirname "$0")
. $BASEDIR/config_env.sh
cd $SMDATABASE_HOME
$DERBY_INSTALL_PATH/startNetworkServer


 
