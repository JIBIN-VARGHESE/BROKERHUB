#!/bin/bash
. $1 >& /dev/null
rm /tmp/error_check_broker_"$ENV"_"$CLIENT_MICROBUS"_* >& /dev/null
rm /tmp/error_check_broker_* >& /dev/null
if [ "$BROKER_CHECK" == "TRUE" ]; then
        cd /home/microbus/bin
        box=`hostname`
        env=`find . -maxdepth 1 -type f \( -name "$1*" -and -name 'ENV_*_LOCAL_*_*' -not -name '*_PLUGINS' \) -print|sed 's|^./||'`
        for broker_file in $env
        do
                no_pattern=ENV_*_LOCAL_"$BROKER_SET"_*_*
                        source /home/microbus/bin/$broker_file >& /dev/null
                        export USERID=`cat $ACTIVEMQ_HOME/conf/users.properties|grep '[^[:blank:]]'|grep -v ^#|head -1|cut -d '=' -f1;`
                        export PASSWD=`cat $ACTIVEMQ_HOME/conf/users.properties|grep '[^[:blank:]]'|grep -v ^#|head -1|cut -d '=' -f2;`
                        export BROKER=`cat $ACTIVEMQ_HOME/conf/activemq.xml|grep 'brokerName'|cut -d '=' -f2 | sed -e 's/\"//g' -e 's/ *$//'`                         export JETTY_PORT=`cat $ACTIVEMQ_HOME/conf/jetty.xml|grep -A 3 jettyPort|grep port|grep value|head -1|cut -d '"' -f4`
                        export URL=http://$box:$JETTY_PORT/api/jolokia/read/org.apache.activemq:type=Broker,brokerName=$BROKER,service=Health
                        wget --user $USERID --password $PASSWD --auth-no-challenge -T 30 --tries=3 $URL -O broker_out.txt 2>>broker_out.txt
                        if (cat broker_out.txt|grep -o '[^{]\+'|grep '"CurrentStatus":"Good"')>/dev/null 2>&1
                        then
                                BROKER_STATUS=`cat broker_out.txt|grep -o '[^{]\+'|grep '"CurrentStatus":"Good"'|cut -d "}" -f1`
                        elif [[ -z $USERID ]] || [[ -z $PASSWD ]] || [[ -z $BROKER ]] || [[ -z $JETTY_PORT ]] 2>&1
                        then
                                BROKER_STATUS=`echo "CurrentStatus:NULL"`
                        else
                                if (ps -eaf|grep `cat $ACTIVEMQ_HOME/data/activemq.pid`|grep -v grep)>/dev/null 2>&1
                                then
                                        BROKER_STATUS=`echo "CurrentStatus:Broker Process found"`
                                else
                                        BROKER_STATUS=`echo "CurrentStatus:NOT_RUNNING"`
                                fi
                        fi
                        export MAIN_URL=http://$box:$JETTY_PORT/api/jolokia/read/org.apache.activemq:type=Broker,brokerName=$BROKER
                        wget --user $USERID --password $PASSWD --auth-no-challenge -T 30 --tries=3 $MAIN_URL -O broker_out_main.txt 2>>broker_out_main.txt
                        export PID=`cat $ACTIVEMQ_HOME/data/activemq.pid`
                        export SUP=`cat broker_out_main.txt | sed -e 's/[}"]*\(.\)[{"]*/\1/g;y/,/\n/' |grep -iwE 'Slave|Uptime'`
                        export DB=`env|grep SQL_DB|cut -d "=" -f2`
                        export TNS=`tnsping $DB|grep "OK"`
                        export SLAVE=`[[ $BROKER_STATUS == "CurrentStatus:Broker Process found" ]] && echo "True" || cat broker_out_main.txt | sed -e 's/[}"]*\(.\)[{"]*/\1/g;y/,/\n/' |grep -iw 'Slave'|cut -d ":" -f2`
                        export UPTIME=`cat broker_out_main.txt | sed -e 's/[}"]*\(.\)[{"]*/\1/g;y/,/\n/' |grep -iw 'Uptime'|cut -d ":" -f2`
                        export b1=`echo $BROKER|cut -d "_" -f2`
                        export b2=`echo $BROKER|cut -d "_" -f3`

echo "<div class='card' style='width:25%;'>"
echo "<div class='card-body' style='font-family:Arial;font-size:15px;text-align:center;'>"
                        if [[ $BROKER_STATUS == "CurrentStatus:NOT_RUNNING" ]]
                        then
                                echo "<b>$b1 _$b2</b><br><i class='fas fa-times-circle' style='color:red;font-size:2em;'></i>"
                        elif [[ $BROKER_STATUS == "CurrentStatus:NULL" ]]
                        then
                                echo "<b>$b1 _$b2</b><br><i class='fas fa-exclamation-triangle text-warning' style='font-size:2em;'></i>"
                        else
                                echo "<b>$b1 _$b2</b><br><i class='fas fa-check-circle' style='color:green;font-size:2em;'></i>"
                        fi
echo "</div>"

echo "<div class='card-footer'>"
echo "<table class='table table-responsive table-sm'><tbody style='font-family:Arial;font-size:15px;'><tr class='d-flex'></tr>"
echo "<tr><td>Broker name</td><td>$BROKER</td></tr>"
echo "<tr><td>Env File</td><td>$broker_file</td></tr>"
echo "<tr><td>User-id</td><td>$USERID</td></tr>"
echo "<tr><td>Password</td><td>$PASSWD</td></tr>"
echo "<tr><td>Jolokia URL</td><td><a href=$MAIN_URL target='_blank'>Click Here</a></td></tr>"
echo "<tr><td>PID</td><td>$PID</td></tr>"
echo "<tr><td>Uptime</td><td>`echo $UPTIME`</td></tr>"
echo "<tr><td>Slave</td><td>$SLAVE</td></tr>"
echo "</tbody></table>"
echo "</div>"

echo "</div>"

        done

else
        echo "Feature not enabled: BROKER_CHECK"
fi
