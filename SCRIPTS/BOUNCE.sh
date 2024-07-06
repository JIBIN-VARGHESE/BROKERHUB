#!/bin/bash
echo "********************************************************************************************************"
echo "This is a Script to Start, Stop and Restart the Microbus Brokers"
echo "Author   :Jibin Varghese"
echo "********************************************************************************************************"

###Input###
broker=$1
process=$2
server=$3


###Defining Functions###
broker_start() {
  echo " "
  echo "Executing the Broker Start Script for: " $broker
  echo "**********************************************************************************"
  . ~/bin/ENV_PROD1_LOCAL; cd ~/bin; . $broker; ./start_amq.sh
  echo " "
  echo "The Broker start script has been executed"
  echo " "
  echo "**********************************************************************************"
  echo "Checking Sentry Status"
  echo "**********************************************************************************"
  # check if Sentry is up or not
  if pgrep -f "sentry" > /dev/null; then
    echo "Sentry is up and running"
  else
    echo "Error: Sentry is not running, Executing the Sentry Start Script"
	echo "--------------------------------------------------------------------------------"
	. ~/bin/ENV_PROD1_LOCAL; cd ~/bin; ./start_sentry.sh
  fi
}


broker_stop() {
  echo " "
  . ~/bin/ENV_PROD1_LOCAL; cd ~/bin; ./stop_sentry.sh
    # check if Sentry is still running
  if pgrep -f "sentry" > /dev/null; then
    # if Sentry is still running, kill the process
	echo "--------------------------------------------------------------------------------"
    echo "Killing the Sentry process since it's not fully down..."
    pi=$(pgrep -f "sentry")
	for p in $pi; do
	kill -9 $p
	done
  else
    echo "Sentry has been Stopped"
  fi
  echo " "
  echo "**********************************************************************************"
  echo "Executing the Broker Stop Script for: " $broker
  echo "**********************************************************************************"
    . ~/bin/ENV_PROD1_LOCAL; cd ~/bin; . $broker; ./stop_amq.sh
  echo " "
  echo "The Stop script has been executed"
  echo " "
  echo "**********************************************************************************"
  echo "Checking Sentry Status"
  echo "**********************************************************************************"
  # check if Sentry is still running
  if pgrep -f "sentry" > /dev/null; then
    echo "Sentry is still running"
	. ~/bin/ENV_PROD1_LOCAL; cd ~/bin; ./stop_sentry.sh
  else
    echo "Sentry is fully down"
  fi
}




broker_restart() {
  echo "Executing the Broker Restart Script for: " $broker
  echo "**********************************************************************************"
    . ~/bin/ENV_PROD1_LOCAL; cd ~/bin; . $broker; ./restart_amq.sh
  echo " "
  echo "The Restart Script has been Executed"
  echo " "
  echo "**********************************************************************************"
  echo "Checking Sentry Status"
  echo "**********************************************************************************"
  # check if Sentry is up or not
  if pgrep -f "sentry" > /dev/null; then
    echo "Sentry is up and running"
  else
    echo "Error: Sentry is not running, Executing the Sentry Start Script"
	echo "--------------------------------------------------------------------------------"
	. ~/bin/ENV_PROD1_LOCAL; cd ~/bin; ./start_sentry.sh
  fi
}


broker_startall()
{
. ~/bin/ENV_PROD1_LOCAL; cd ~/bin; . ENV_PROD1_LOCAL; ./start_all.sh
echo "The Script to start all Brokers has been Executed"
}


broker_stopall()
{
. ~/bin/ENV_PROD1_LOCAL; cd ~/bin; . ENV_PROD1_LOCAL; ./stop_all.sh
echo "The Script to Stop all Brokers has been Executed"
}

sentry_start()
{
. ~/bin/ENV_PROD1_LOCAL; cd ~/bin; ./start_sentry.sh
echo "Sentry has been Started"
}

sentry_stop()
{
. ~/bin/ENV_PROD1_LOCAL; cd ~/bin; ./stop_sentry.sh
echo "Sentry has been Stopped"
}

status()
{
echo "Checking Status of Broker: "$broker
. ~/bin/ENV_PROD1_LOCAL; cd ~/bin; . $broker; ./status_amq.sh
}






###Conditions --> Start/Stop/Restart
if [ $process == "start" ]
then
broker_start $broker
elif [ $process == "stop" ]
then
broker_stop $broker
elif [ $process == "restart" ]
then
broker_restart $broker

###Conditions --> Status
elif [ $process == "status" ]
then
status $broker


###Conditions --> Sentry
elif [ $process == "sentrystart" ]
then
sentry_start
elif [ $process == "sentrystop" ]
then
sentry_stop


else
echo "ERROR"
fi
