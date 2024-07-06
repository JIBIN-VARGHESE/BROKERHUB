#!/bin/bash
echo "********************************************************************************************************"
echo "This is a Script to Start & Stop All Microbus Brokers"
echo "Author   :Jibin Varghese"
echo "********************************************************************************************************"

###Input###
process=$1
server=$2


###Defining Functions###
broker_startall()
{
. ~/bin/ENV_PROD1_LOCAL; cd ~/bin; . ENV_PROD1_LOCAL; ./start_all.sh
echo "All Brokers has been succesfully Started"
}


broker_stopall()
{
. ~/bin/ENV_PROD1_LOCAL; cd ~/bin; . ENV_PROD1_LOCAL; ./stop_all.sh
echo "All Brokers has been succesfully Stopped"
}


###Conditions --> Startall/Stopall
if [ $process == "startall" ]
then
broker_startall
elif [ $process == "stopall" ]
then
broker_stopall
else
echo "ERROR"
fi
