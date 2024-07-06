#!/bin/bash
broker=`echo "$QUERY_STRING" | awk -F "[=&]" '{print $2}' | cut -d "_" -f2-`
server=`echo "$QUERY_STRING" | awk -F= '{print $2}' | cut -d "_" -f1`
process=`echo "$QUERY_STRING"|awk -F "&" '{print $2}'|cut -d "=" -f2`


echo "Content-type: text/html"
echo ""
echo "<!DOCTYPE html>"
echo "<html>"
echo "<title>SERVER DATA</title>"
echo "<link rel="icon" type="image/jpg" href="https://www.lumen.com/etc.clientlibs/ewcmams/clientlibs/clientlib-larry-favicon/resources/favicon.png" />"
echo "<style>"
echo "#logo {
          display: inline-block;
          margin: 7px; /* margin: 10px was off */
          float: left;
          height: 70px;
          width: auto; /* correct proportions to specified height */
          border-radius: 50%; /* makes it a circle */
        }"
echo "html, body {
          width: 100%;
          height:100%;

        }"

echo "#div1 { height: 500px; width:800px; overflow: scroll; }"
echo "</style>"
echo "<pre>"
echo "<pre>"
echo "<pre>"
echo "<head>"
echo "<meta charset="UTF-8" /><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><meta name="viewport" content="width=device-width, initial-scale=1.0">"
echo "<a href="#"><img id="logo" src="lumen.jpg"></a>"
echo "</head>"
echo "</pre>"
echo "</pre>"
echo "</pre>"
echo "<body>"
echo "<pre>"

if [ $server == "vlodp002.corp.intranet" ]
then
ssh microbus@$server ". ~/bin/ENV_PROD1_LOCAL;cd /home/microbus/Tool;./BOUNCE.sh $broker $process"
elif [ $server == "vlodp003.corp.intranet" ]
then
ssh microbus@$server ". ~/bin/ENV_PROD1_LOCAL;cd /home/microbus/Tool;./BOUNCE.sh $broker $process"
elif [ $server == "vlddp002.corp.intranet" ]
then
ssh microbus@$server ". ~/bin/ENV_PROD1_LOCAL;cd /home/microbus/Tool;./BOUNCE.sh $broker $process"
elif [ $server == "vlddp003.corp.intranet" ]
then
ssh microbus@$server ". ~/bin/ENV_PROD1_LOCAL;cd /home/microbus/Tool;./BOUNCE.sh $broker $process"
elif [ $server == "vlmdp001.corp.intranet" ]
then
ssh microbus@$server ". ~/bin/ENV_PROD1_LOCAL;cd /home/microbus/Tool;./BOUNCE.sh $broker $process"
elif [ $server == "vlmdp002.corp.intranet" ]
then
ssh microbus@$server ". ~/bin/ENV_PROD1_LOCAL;cd /home/microbus/Tool;./BOUNCE.sh $broker $process"
elif [ $server == "vlddt002.test.intranet" ]
then
ssh microbus@$server ". ~/bin/ENV_TEST1_LOCAL;cd /home/microbus/Tool;./BOUNCE.sh $broker $process"
elif [ $server == "vlddt003.test.intranet" ]
then
ssh microbus@$server ". ~/bin/ENV_TEST1_LOCAL;cd /home/microbus/Tool;./BOUNCE.sh $broker $process"
elif [ $server == "vlodt002.test.intranet" ]
then
ssh microbus@$server ". ~/bin/ENV_TEST1_LOCAL;cd /home/microbus/Tool;./BOUNCE.sh $broker $process"
elif [ $server == "vlodt003.test.intranet" ]
then
ssh microbus@$server ". ~/bin/ENV_TEST1_LOCAL;cd /home/microbus/Tool;./BOUNCE.sh $broker $process"
elif [ $server == "vlmdt001.test.intranet" ]
then
ssh microbus@$server ". ~/bin/ENV_TEST1_LOCAL;cd /home/microbus/Tool;./BOUNCE.sh $broker $process"
elif [ $server == "vlmdt002.test.intranet" ]
then
ssh microbus@$server ". ~/bin/ENV_TEST1_LOCAL;cd /home/microbus/Tool;./BOUNCE.sh $broker $process"
else
echo "Error"
fi


echo "</pre>"
exit
echo "</body>"
echo "</html>"
