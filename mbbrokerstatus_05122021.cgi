#!/bin/bash
#arg=vlddt002
arg=`echo "$QUERY_STRING" | awk -F= '{print $2}' | cut -d "&" -f1`
#arg2=`echo "$QUERY_STRING"|awk -F "&" '{print $2}'|cut -d "=" -f2`
echo "Content-type: text/html"
echo ""
echo "<!DOCTYPE html>"
echo "<html><head>"
echo "<meta charset="UTF-8" /><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><meta name="viewport" content="width=device-width, initial-scale=1.0">"
echo "<link rel='stylesheet' type='text/css' href='broker.css'>"
echo "</head>"
echo "<pre>"
echo $arg

if [ $arg == "vlddt002.test.intranet" ]
then
ssh microbus@$arg ". ~/bin/ENV_DEV1_LOCAL;cd /home/microbus/Tool;./wrap.sh"
elif [ $arg == "vlddt003.test.intranet" ]
then
ssh microbus@$arg ". ~/bin/ENV_DEV1_LOCAL;cd /home/microbus/Tool;./wrap.sh"
elif [ $arg == "vlodt002.test.intranet" ]
then
ssh microbus@$arg ". ~/bin/ENV_DEV1_LOCAL;cd /home/microbus/Tool;./wrap.sh"
elif [ $arg == "vlodt003.test.intranet" ]
then
ssh microbus@$arg ". ~/bin/ENV_DEV1_LOCAL;cd /home/microbus/Tool;./wrap.sh"
elif [ $arg == "vlmdt001.test.intranet" ]
then
ssh microbus@$arg ". ~/bin/ENV_DEV1_LOCAL;cd /home/microbus/Tool;./wrap.sh"
elif [ $arg == "vlmdt002.test.intranet" ]
then
ssh microbus@$arg ". ~/bin/ENV_DEV1_LOCAL;cd /home/microbus/Tool;./wrap.sh"
elif [ $arg == "vlodp002.corp.intranet" ]
then
ssh microbus@$arg ". ~/bin/ENV_PROD1_LOCAL;cd /home/microbus/Tool;./wrap.sh"
elif [ $arg == "vlodp003.corp.intranet" ]
then
ssh microbus@$arg ". ~/bin/ENV_PROD1_LOCAL;cd /home/microbus/Tool;./wrap.sh"
elif [ $arg == "vlddp002.corp.intranet" ]
then
ssh microbus@$arg ". ~/bin/ENV_PROD1_LOCAL;cd /home/microbus/Tool;./wrap.sh"
elif [ $arg == "vlddp003.corp.intranet" ]
then
ssh microbus@$arg ". ~/bin/ENV_PROD1_LOCAL;cd /home/microbus/Tool;./wrap.sh"
elif [ $arg == "vlmdp001.corp.intranet" ]
then
ssh microbus@$arg ". ~/bin/ENV_PROD1_LOCAL;cd /home/microbus/Tool;./wrap.sh"
elif [ $arg == "vlmdp002.corp.intranet" ]
then
ssh microbus@$arg ". ~/bin/ENV_PROD1_LOCAL;cd /home/microbus/Tool;./wrap.sh"
else
echo "Error"
fi
echo "</pre>"
exit
echo "</body>"
echo "</html>"
