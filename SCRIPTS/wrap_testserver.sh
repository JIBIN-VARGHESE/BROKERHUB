#!/bin/bash
cd /home/microbus/bin
pattern='ENV_*_LOCAL_*_*_*'
#list=(`ls ENV_*_LOCAL_* --ignore="*MICROBUS" --ignore="*MICROBUS*"`)
list=(`find . -maxdepth 1 -type f \( -name 'ENV_*_LOCAL_*_*' -and -not -name 'ENV_*_LOCAL_*_*_*' -and -not -name '*_PLUGINS*' -and -not -name '*_SENTRY' -and -not -name '*_bkp*' -and -not -name '*_backup*' \) -print |sed 's|^./||'`)
e2e=(`find . -maxdepth 1 -type f \( -name 'ENV_*_LOCAL_*_*' -and -not -name 'ENV_*_LOCAL_*_*_*' -and -not -name '*_PLUGINS*' -and -not -name '*_SENTRY' -and -name '*E2E*' -and -not -name '*_bkp*' -and -not -name '*_backup*' \) -print |sed 's|^./||'`)
dev1=(`find . -maxdepth 1 -type f \( -name 'ENV_*_LOCAL_*_*' -and -not -name 'ENV_*_LOCAL_*_*_*' -and -not -name '*_PLUGINS*' -and -not -name '*_SENTRY' -and -name '*DEV1*' -and -not -name '*_bkp*' -and -not -name '*_backup*' \) -print |sed 's|^./||'`)
dev2=(`find . -maxdepth 1 -type f \( -name 'ENV_*_LOCAL_*_*' -and -not -name 'ENV_*_LOCAL_*_*_*' -and -not -name '*_PLUGINS*' -and -not -name '*_SENTRY' -and -name '*DEV2*' -and -not -name '*_bkp*' -and -not -name '*_backup*' \) -print |sed 's|^./||'`)
test1=(`find . -maxdepth 1 -type f \( -name 'ENV_*_LOCAL_*_*' -and -not -name 'ENV_*_LOCAL_*_*_*' -and -not -name '*_PLUGINS*' -and -not -name '*_SENTRY' -and -name '*TEST1*' -and -not -name '*_bkp*' -and -not -name '*_backup*' \) -print |sed 's|^./||'`)
test2=(`find . -maxdepth 1 -type f \( -name 'ENV_*_LOCAL_*_*' -and -not -name 'ENV_*_LOCAL_*_*_*' -and -not -name '*_PLUGINS*' -and -not -name '*_SENTRY' -and -name '*TEST2*' -and -not -name '*_bkp*' -and -not -name '*_backup*' \) -print |sed 's|^./||'`)

echo "<div class='row'>"
echo "<div class='col-sm-1'>"

echo "<div class='nav flex-column nav-pills' id='v-pills-tab' role='tablist' aria-orientation='vertical'>"
echo "<a class='nav-link active' id='v-pills-dev2-tab' data-toggle='pill' href='#v-pills-dev1-vlmdt001' role='tab' aria-controls='v-pills-dev1' aria-selected='false'>DEV1</a>"
echo "<a class='nav-link' id='v-pills-dev2-tab' data-toggle='pill' href='#v-pills-dev2-vlmdt001' role='tab' aria-controls='v-pills-dev2' aria-selected='false'>DEV2</a>"
echo "<a class='nav-link' id='v-pills-test1-tab' data-toggle='pill' href='#v-pills-test1-vlmdt001' role='tab' aria-controls='v-pills-test1' aria-selected='false'>TEST1</a>"
echo "<a class='nav-link' id='v-pills-test2-tab' data-toggle='pill' href='#v-pills-test2-vlmdt001' role='tab' aria-controls='v-pills-test2' aria-selected='false'>TEST2</a>"
echo "<a class='nav-link' id='v-pills-e2e-tab' data-toggle='pill' href='#v-pills-e2e-vlmdt001' role='tab' aria-controls='v-pills-e2e' aria-selected='true'>E2E</a>"
echo "</div>"
echo "</div>"

###########################################DEV1##########################################################
echo "<div class='col-sm-11'>"
echo "<div class='tab-content' id='v-pills-tabContent'>"
echo "<div class='tab-pane fade show active' id='v-pills-dev1-vlmdt001' role='tabpanel' aria-labelledby='v-pills-dev1-tab'>"
echo "<div class='card' style='back-ground color:black;'><div class='card-header'><style>h5 {
  font-family: Arial, sans-serif;
  font-size: 18px;
  color: solid black;
}
</style><h5 class='mb-0' style='font-size: 24px; font-family:Arial'>DEV1 :: `hostname`</h5>"
echo "<form id="bounce" class="form-inline" action="http://lxomavmap299.ad.qintra.com:50666/Tools/BROKERCHECKTOOL/test3.cgi" method="get" target=\"_blank\"><select class="selectpicker1" name="process_name" id="process_name"><option value="" disabled selected>---Choose the Action---</option><option value="startall">STARTALL</option><option value="stopall">STOPALL</option></select><style> .selectpicker1 {
  color: black;
  border: 0 none;
  border-radius: 100px;
  padding: 5px;
  outline: solid black;
  width: 210px;
}</style> &nbsp;&nbsp; <input class="button0" type="submit" name=`hostname` value="SUBMIT" id="submit"><style> .button0 {
  width: 110px;
  height: 35px;
  font-family: 'Roboto', sans-serif;
  font-size: 10px;
  text-transform: uppercase;
  letter-spacing: 2.5px;
  font-weight: 400;
  color: white;
  background-color: black;
  border: none;
  border-radius: 30px;
  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
  transition: all 0.10s ease 0s;
  cursor: pointer;
  outline: solid black;
  padding: 5px;
  display:inline-block;
}
.button0:hover {
  background-color: #fff;
  color: black;
  transform: translateY(-7px);
}</style></form><br>"
#Dropdown1
echo "<form id="bounce" class="form-inline" action="http://lxomavmap299.ad.qintra.com:50666/Tools/BROKERCHECKTOOL/test.cgi" method="get" target=\"_blank\">"
declare -a options=(`for i in ${dev1[@]}; do if [[ $i != $pattern ]]; then echo $i; fi; done`)
echo "<select class="selectpicker" name="broker_name" id="broker_name">"
echo "<option value="" disabled selected>---Select the BROKER---</option>"
for option in "${options[@]}"; do
  echo "  <option value=`hostname`_$option>$option</option>"
done
echo "</select><style> .selectpicker {
  color: black;
  border: 0 none;
  border-radius: 100px;
  padding: 5px;
  outline: solid black;
  margin:.2px;
}</style> &nbsp;&nbsp;"

#Dropdown2 & Button
echo "<select class="selectpicker" name="process_name" id="process_name">"
echo " <option value="" disabled selected>---Choose the Action---</option><option value="start">START</option><option value="stop">STOP</option><option value="restart">RESTART</option><option value="status">STATUS</option></select><style> .selectpicker {
  color: black;
  border: 0 none;
  border-radius: 100px;
  padding: 5px;
  outline: solid black;
}</style> &nbsp;&nbsp; <input class="button3" type="submit" value="SUBMIT" id="submit"><style> .button3 {
  width: 130px;
  height: 35px;
  font-family: 'Roboto', sans-serif;
  font-size: 10px;
  text-transform: uppercase;
  letter-spacing: 2.5px;
  font-weight: 400;
  color: white;
  background-color: #0075C9;
  border: none;
  border-radius: 30px;
  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
  transition: all 0.10s ease 0s;
  cursor: pointer;
  outline: solid black;
  padding: 5px;
  display:inline-block;
}
.button3:hover {
  background-color: #fff;
  color: black;
  transform: translateY(-7px);
}</style></form>"
echo "<div class='row'>"
env_array=(`for i in ${dev1[@]}; do if [[ $i != $pattern ]]; then echo $i; fi; done`)
cd /home/microbus/Tool
for i in ${env_array[@]}
do
./tool.sh $i
done
echo "</div>"
echo "</div></div>"
echo "</div>"

###########################################DEV2##########################################################
echo "<div class='tab-pane fade' id='v-pills-dev2-vlmdt001' role='tabpanel' aria-labelledby='v-pills-dev2-tab'>"
echo "<div class='card' style='back-ground color:black;'><div class='card-header'><style>h5 {
  font-family: Arial, sans-serif;
  font-size: 18px;
  color: solid black;
}
</style><h5 class='mb-0' style='font-size: 24px; font-family:Arial'>DEV2 :: `hostname`</h5>"
echo "<form id="bounce" class="form-inline" action="http://lxomavmap299.ad.qintra.com:50666/Tools/BROKERCHECKTOOL/test3.cgi" method="get" target=\"_blank\"><select class="selectpicker1" name="process_name" id="process_name"><option value="" disabled selected>---Choose the Action---</option><option value="startall">STARTALL</option><option value="stopall">STOPALL</option></select><style> .selectpicker1 {
  color: black;
  border: 0 none;
  border-radius: 100px;
  padding: 5px;
  outline: solid black;
  width: 210px;
}</style> &nbsp;&nbsp; <input class="button0" type="submit" name=`hostname` value="SUBMIT" id="submit"><style> .button0 {
  width: 110px;
  height: 35px;
  font-family: 'Roboto', sans-serif;
  font-size: 10px;
  text-transform: uppercase;
  letter-spacing: 2.5px;
  font-weight: 400;
  color: white;
  background-color: black;
  border: none;
  border-radius: 30px;
  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
  transition: all 0.10s ease 0s;
  cursor: pointer;
  outline: solid black;
  padding: 5px;
  display:inline-block;
}
.button0:hover {
  background-color: #fff;
  color: black;
  transform: translateY(-7px);
}</style></form><br>"
#Dropdown1
echo "<form id="bounce" class="form-inline" action="http://lxomavmap299.ad.qintra.com:50666/Tools/BROKERCHECKTOOL/test.cgi" method="get" target=\"_blank\">"
declare -a options=(`for i in ${dev2[@]}; do if [[ $i != $pattern ]]; then echo $i; fi; done`)
echo "<select class="selectpicker" name="broker_name" id="broker_name">"
echo "<option value="" disabled selected>---Select the BROKER---</option>"
for option in "${options[@]}"; do
  echo "  <option value=`hostname`_$option>$option</option>"
done
echo "</select><style> .selectpicker {
  color: black;
  border: 0 none;
  border-radius: 100px;
  padding: 5px;
  outline: solid black;
  margin:.2px;
}</style> &nbsp;&nbsp;"

#Dropdown2 & Button
echo "<select class="selectpicker" name="process_name" id="process_name">"
echo " <option value="" disabled selected>---Choose the Action---</option><option value="start">START</option><option value="stop">STOP</option><option value="restart">RESTART</option><option value="status">STATUS</option></select><style> .selectpicker {
  color: black;
  border: 0 none;
  border-radius: 100px;
  padding: 5px;
  outline: solid black;
}</style> &nbsp;&nbsp; <input class="button3" type="submit" value="SUBMIT" id="submit"><style> .button3 {
  width: 130px;
  height: 35px;
  font-family: 'Roboto', sans-serif;
  font-size: 10px;
  text-transform: uppercase;
  letter-spacing: 2.5px;
  font-weight: 400;
  color: white;
  background-color: #0075C9;
  border: none;
  border-radius: 30px;
  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
  transition: all 0.10s ease 0s;
  cursor: pointer;
  outline: solid black;
  padding: 5px;
  display:inline-block;
}
.button3:hover {
  background-color: #fff;
  color: black;
  transform: translateY(-7px);
}</style></form>"
echo "</div>"
echo "<div class='card-body'>"
echo "<div class='row'>"
env_array=(`for i in ${dev2[@]}; do if [[ $i != $pattern ]]; then echo $i; fi; done`)
cd /home/microbus/Tool
for i in ${env_array[@]}
do
./tool.sh $i
done
echo "</div>"
echo "</div></div>"
echo "</div>"

###########################################TEST1##########################################################
echo "<div class='tab-pane fade' id='v-pills-test1-vlmdt001' role='tabpanel' aria-labelledby='v-pills-test1-tab'>"
echo "<div class='card' style='back-ground color:black;'><div class='card-header'><style>h5 {
  font-family: Arial, sans-serif;
  font-size: 18px;
  color: solid black;
}
</style><h5 class='mb-0' style='font-size: 24px; font-family:Arial'>TEST1 :: `hostname`</h5>"
echo "<form id="bounce" class="form-inline" action="http://lxomavmap299.ad.qintra.com:50666/Tools/BROKERCHECKTOOL/test3.cgi" method="get" target=\"_blank\"><select class="selectpicker1" name="process_name" id="process_name"><option value="" disabled selected>---Choose the Action---</option><option value="startall">STARTALL</option><option value="stopall">STOPALL</option></select><style> .selectpicker1 {
  color: black;
  border: 0 none;
  border-radius: 100px;
  padding: 5px;
  outline: solid black;
  width: 210px;
}</style> &nbsp;&nbsp; <input class="button0" type="submit" name=`hostname` value="SUBMIT" id="submit"><style> .button0 {
  width: 110px;
  height: 35px;
  font-family: 'Roboto', sans-serif;
  font-size: 10px;
  text-transform: uppercase;
  letter-spacing: 2.5px;
  font-weight: 400;
  color: white;
  background-color: black;
  border: none;
  border-radius: 30px;
  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
  transition: all 0.10s ease 0s;
  cursor: pointer;
  outline: solid black;
  padding: 5px;
  display:inline-block;
}
.button0:hover {
  background-color: #fff;
  color: black;
  transform: translateY(-7px);
}</style></form><br>"
#Dropdown1
echo "<form id="bounce" class="form-inline" action="http://lxomavmap299.ad.qintra.com:50666/Tools/BROKERCHECKTOOL/test.cgi" method="get" target=\"_blank\">"
declare -a options=(`for i in ${test1[@]}; do if [[ $i != $pattern ]]; then echo $i; fi; done`)
echo "<select class="selectpicker" name="broker_name" id="broker_name">"
echo "<option value="" disabled selected>---Select the BROKER---</option>"
for option in "${options[@]}"; do
  echo "  <option value=`hostname`_$option>$option</option>"
done
echo "</select><style> .selectpicker {
  color: black;
  border: 0 none;
  border-radius: 100px;
  padding: 5px;
  outline: solid black;
  margin:.2px;
}</style> &nbsp;&nbsp;"

#Dropdown2 & Button
echo "<select class="selectpicker" name="process_name" id="process_name">"
echo " <option value="" disabled selected>---Choose the Action---</option><option value="start">START</option><option value="stop">STOP</option><option value="restart">RESTART</option><option value="status">STATUS</option></select><style> .selectpicker {
  color: black;
  border: 0 none;
  border-radius: 100px;
  padding: 5px;
  outline: solid black;
}</style> &nbsp;&nbsp; <input class="button3" type="submit" value="SUBMIT" id="submit"><style> .button3 {
  width: 130px;
  height: 35px;
  font-family: 'Roboto', sans-serif;
  font-size: 10px;
  text-transform: uppercase;
  letter-spacing: 2.5px;
  font-weight: 400;
  color: white;
  background-color: #0075C9;
  border: none;
  border-radius: 30px;
  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
  transition: all 0.10s ease 0s;
  cursor: pointer;
  outline: solid black;
  padding: 5px;
  display:inline-block;
}
.button3:hover {
  background-color: #fff;
  color: black;
  transform: translateY(-7px);
}</style></form></div>"
echo "<div class='card-body'>"
echo "<div class='row'>"
env_array=(`for i in ${test1[@]}; do if [[ $i != $pattern ]]; then echo $i; fi; done`)
cd /home/microbus/Tool
for i in ${env_array[@]}
do
./tool.sh $i
done
echo "</div>"
echo "</div></div>"
echo "</div>"


###########################################TEST2##########################################################
echo "<div class='tab-pane fade' id='v-pills-test2-vlmdt001' role='tabpanel' aria-labelledby='v-pills-test2-tab'>"
echo "<div class='card' style='back-ground color:black;'><div class='card-header'><style>h5 {
  font-family: Arial, sans-serif;
  font-size: 18px;
  color: solid black;
}
</style><h5 class='mb-0' style='font-size: 24px; font-family:Arial'>TEST2 :: `hostname`</h5>"
echo "<form id="bounce" class="form-inline" action="http://lxomavmap299.ad.qintra.com:50666/Tools/BROKERCHECKTOOL/test3.cgi" method="get" target=\"_blank\"><select class="selectpicker1" name="process_name" id="process_name"><option value="" disabled selected>---Choose the Action---</option><option value="startall">STARTALL</option><option value="stopall">STOPALL</option></select><style> .selectpicker1 {
  color: black;
  border: 0 none;
  border-radius: 100px;
  padding: 5px;
  outline: solid black;
  width: 210px;
}</style> &nbsp;&nbsp; <input class="button0" type="submit" name=`hostname` value="SUBMIT" id="submit"><style> .button0 {
  width: 110px;
  height: 35px;
  font-family: 'Roboto', sans-serif;
  font-size: 10px;
  text-transform: uppercase;
  letter-spacing: 2.5px;
  font-weight: 400;
  color: white;
  background-color: black;
  border: none;
  border-radius: 30px;
  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
  transition: all 0.10s ease 0s;
  cursor: pointer;
  outline: solid black;
  padding: 5px;
  display:inline-block;
}
.button0:hover {
  background-color: #fff;
  color: black;
  transform: translateY(-7px);
}</style></form><br>"
#Dropdown1
echo "<form id="bounce" class="form-inline" action="http://lxomavmap299.ad.qintra.com:50666/Tools/BROKERCHECKTOOL/test.cgi" method="get" target=\"_blank\">"
declare -a options=(`for i in ${test2[@]}; do if [[ $i != $pattern ]]; then echo $i; fi; done`)
echo "<select class="selectpicker" name="broker_name" id="broker_name">"
echo "<option value="" disabled selected>---Select the BROKER---</option>"
for option in "${options[@]}"; do
  echo "  <option value=`hostname`_$option>$option</option>"
done
echo "</select><style> .selectpicker {
  color: black;
  border: 0 none;
  border-radius: 100px;
  padding: 5px;
  outline: solid black;
  margin:.2px;
}</style> &nbsp;&nbsp;"

#Dropdown2 & Button
echo "<select class="selectpicker" name="process_name" id="process_name">"
echo " <option value="" disabled selected>---Choose the Action---</option><option value="start">START</option><option value="stop">STOP</option><option value="restart">RESTART</option><option value="status">STATUS</option></select><style> .selectpicker {
  color: black;
  border: 0 none;
  border-radius: 100px;
  padding: 5px;
  outline: solid black;
}</style> &nbsp;&nbsp; <input class="button3" type="submit" value="SUBMIT" id="submit"><style> .button3 {
  width: 130px;
  height: 35px;
  font-family: 'Roboto', sans-serif;
  font-size: 10px;
  text-transform: uppercase;
  letter-spacing: 2.5px;
  font-weight: 400;
  color: white;
  background-color: #0075C9;
  border: none;
  border-radius: 30px;
  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
  transition: all 0.10s ease 0s;
  cursor: pointer;
  outline: solid black;
  padding: 5px;
  display:inline-block;
}
.button3:hover {
  background-color: #fff;
  color: black;
  transform: translateY(-7px);
}</style></form>"
echo "</div>"
echo "<div class='card-body'>"
echo "<div class='row'>"
env_array=(`for i in ${test2[@]}; do if [[ $i != $pattern ]]; then echo $i; fi; done`)
cd /home/microbus/Tool
for i in ${env_array[@]}
do
./tool.sh $i
done
echo "</div>"
echo "</div></div>"
echo "</div>"


###########################################E2E##########################################################
echo "<div class='tab-pane fade' id='v-pills-e2e-vlmdt001' role='tabpanel' aria-labelledby='v-pills-e2e-tab'>"
echo "<div class='card' style='back-ground color:black;'><div class='card-header'><style>h5 {
  font-family: Arial, sans-serif;
  font-size: 18px;
  color: solid black;
}
</style><h5 class='mb-0' style='font-size: 24px; font-family:Arial'>E2E :: `hostname`</h5>"
echo "<form id="bounce" class="form-inline" action="http://lxomavmap299.ad.qintra.com:50666/Tools/BROKERCHECKTOOL/test3.cgi" method="get" target=\"_blank\"><select class="selectpicker1" name="process_name" id="process_name"><option value="" disabled selected>---Choose the Action---</option><option value="startall">STARTALL</option><option value="stopall">STOPALL</option></select><style> .selectpicker1 {
  color: black;
  border: 0 none;
  border-radius: 100px;
  padding: 5px;
  outline: solid black;
  width: 210px;
}</style> &nbsp;&nbsp; <input class="button0" type="submit" name=`hostname` value="SUBMIT" id="submit"><style> .button0 {
  width: 110px;
  height: 35px;
  font-family: 'Roboto', sans-serif;
  font-size: 10px;
  text-transform: uppercase;
  letter-spacing: 2.5px;
  font-weight: 400;
  color: white;
  background-color: black;
  border: none;
  border-radius: 30px;
  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
  transition: all 0.10s ease 0s;
  cursor: pointer;
  outline: solid black;
  padding: 5px;
  display:inline-block;
}
.button0:hover {
  background-color: #fff;
  color: black;
  transform: translateY(-7px);
}</style></form><br>"
#Dropdown1
echo "<form id="bounce" class="form-inline" action="http://lxomavmap299.ad.qintra.com:50666/Tools/BROKERCHECKTOOL/test.cgi" method="get" target=\"_blank\">"
declare -a options=(`for i in ${e2e[@]}; do if [[ $i != $pattern ]]; then echo $i; fi; done`)
echo "<select class="selectpicker" name="broker_name" id="broker_name">"
echo "<option value="" disabled selected>---Select the BROKER---</option>"
for option in "${options[@]}"; do
  echo "  <option value=`hostname`_$option>$option</option>"
done
echo "</select><style> .selectpicker {
  color: black;
  border: 0 none;
  border-radius: 100px;
  padding: 5px;
  outline: solid black;
  margin:.2px;
}</style> &nbsp;&nbsp;"

#Dropdown2 & Button
echo "<select class="selectpicker" name="process_name" id="process_name">"
echo " <option value="" disabled selected>---Choose the Action---</option><option value="start">START</option><option value="stop">STOP</option><option value="restart">RESTART</option><option value="status">STATUS</option></select><style> .selectpicker {
  color: black;
  border: 0 none;
  border-radius: 100px;
  padding: 5px;
  outline: solid black;
}</style> &nbsp;&nbsp; <input class="button3" type="submit" value="SUBMIT" id="submit"><style> .button3 {
  width: 130px;
  height: 35px;
  font-family: 'Roboto', sans-serif;
  font-size: 10px;
  text-transform: uppercase;
  letter-spacing: 2.5px;
  font-weight: 400;
  color: white;
  background-color: #0075C9;
  border: none;
  border-radius: 30px;
  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
  transition: all 0.10s ease 0s;
  cursor: pointer;
  outline: solid black;
  padding: 5px;
  display:inline-block;
}
.button3:hover {
  background-color: #fff;
  color: black;
  transform: translateY(-7px);
}</style></form>"
echo "</div>"
echo "<div class='card-body'>"
echo "<div class='row'>"
env_array=(`for i in ${e2e[@]}; do if [[ $i != $pattern ]]; then echo $i; fi; done`)
cd /home/microbus/Tool
for i in ${env_array[@]}
do
./tool.sh $i
done
echo "</div>"
echo "</div></div>"
echo "</div>"


echo "</div>"
echo "</div>"
