#!/bin/sh
#
#  Create the Fasserve DB
#
#  HAE
#  Chris Purtell
#  Jan. 10, 2013

. ./config_env.sh
cd $SMDATABASE_HOME
$DERBY_INSTALL_PATH/ij $SCRIPTS_HOME/createHaeDB.txt

