# used for configure the environment variables
# --- Setting up Oracle related variables ---
ORACLE_SID=<< to provide SID value>>;
export ORACLE_SID
ORACLE_HOME=/oracle/app/product/12c_client/;
export ORACLE_HOME
PATH=/oracle/app/product/12c_client/bin:$PATH;
export PATH
LD_LIBRARY_PATH=/oracle/app/product/12c_client/lib;
export LD_LIBRARY_PATH
ORACLE_IP=<<to provide IP address>>;
export ORACLE_IP 
ORACLE_PORT=1521;
export ORACLE_PORT 
ORAUID=none==;export ORAUID 
ORAPWD=none==;export ORAPWD 
ORATYPE=$ORATYPE;export ORATYPE 

# -- Setup Other Variable ---

File_Process=/usr1/myPc;export File_Process
FILE_HOME=$File_Process/HCL_File_Processing;export FILE_HOME
SETTLEMENT_HOME_PATH=/usr1/myPc/AUTOSETTLEMENT;export SETTLEMENT_HOME_PATH
PROFILE_PATH=$File_Process/bin; export PROFILE_PATH 
DT=`date +"%d-%m-%Y"`; export DT
LOG_NAME=$FILE_HOME/LOG/runlog;export LOG_NAME 
CLOG_NAME=$FILE_HOME/LOG/HCL_$DT.log;export CLOG_NAME
STATUS_FILE=$FILE_HOME/LOG/HCL_STATUS_$DT.txt;export STATUS_FILE

JAVA_HOME="/usr1/java_homes/jdk1.7.0_79"
export JAVA_HOME 
PATH=$JAVA_HOME/bin:$PATH 
export PATH 

# --- Setup Java relared variable ---
java -jar $FILE_HOME/AES.jar

# --- Read Oracle User id and password from file ---
useridfile="$FILE_HOME/bin/myuserid.txt" 
read ORAUID < "$useridfile" 
pwdfile="$FILE_HOME/bin/mypwd.txt" 
read ORAPWD < "$pwdfile" 
#rm -rf $useridfile
#rm -rf $pwdfile
