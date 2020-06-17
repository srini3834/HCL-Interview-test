cd /usr1/myPc/FILE_HOME
source ./ENV.sh export
# ------------------------ Main Function Processing --------------------------
# Read read from STATUS_FILE
arr[0]="Pending"; arr[1]="Pending";
if [ -e $File_Process/$STATUS_FILE ]
then
while read line
do
	key=`echo $line | awk '{print $1}'`
	value=`echo $line | awk '{print $2}'`
	if $value -e ""
	then
	   value = "Pending"
	fi
	arr[$key]=$value
done <$File_Process/$STATUS_FILE
fi
# ---- Clear Screen and Display Menu Items -------
clear
echo   "
	_____________________________________________________________
	 "$(tput setaf 3) CBC $(tput setab 8) HCL FILE PROCESSING SYSTEM $(tput sgr 0)"  

		OPTIONS    FILE_PROCESS_PROGRAM            STATUS
	_______________________________________________________________

	     	1  HCL_FILE_PROCESS                          ${arr[1]}
		
       ___________________________________________________________
	PLEASE TAKE BACKUP AND ENTER YOUR OPTION TO CONTINUE OR "$(tput setaf 3)Q$(tput sgr 0)" TO QUIT: 
             "$(tput setaf 1) 0 = $(tput setab 8) FAIL $(tput sgr 0)"		
             "$(tput setaf 2) 1 = $(tput setab 8) PASS $(tput sgr 0)""
	read opt

# Exit if Q
if [ $opt = "q"  -o $opt = "Q" ]
then
    echo "FILE IS PROCESSED SUCCESSFULLY
                      THANK YOU!"

	exit 0;
fi

# Set for All option
if [ $opt = "a"  -o $opt = "A" ]
then
    choice=1
	opt="A"
else
	choice=$opt
fi

# ---- Execute Options and record ----
while [ $choice -le 1 ]
do
		#if [ ${arr[$choice]} != "PASS" ]
		#then
			# ---- Case Processing -----
			case $choice in
			 1) cmd="$FILE_HOME/SHELL_FILE/PROCESS.sh FP";;
			                
			esac

			# --- Execute Script and get the status ---
			echo `date` "USER:$USER  STARRING PROCESS FOR OPTION:$choice COMMAND:$cmd "$LOG_NAME
			$cmd  > joblog

			if [ $? -eq 0 ]
				then
					estatus="1"
			else
				estatus="0"
			fi

			# analyse the log file and find our errors and construct the error string
			while read line
			do
				etype=`echo $line | awk '{print $1}'`
				err=`echo $line | awk '{print $2}'`
				errdesc=`echo $line | awk '{print $3}'`
				#err = ${err//_/ }
				#errdesc = ${errdesc//_/ }

				# search in file find out error occurance
				grep $err joblog > chklog
				if [ -s chklog ]
				then
					echo $etype: $errdesc
					echo $etype: $errdesc  >>$LOG_NAME
					if [ $etype = "ERROR" ]
					then
						estatus="0"
					fi
				fi
			done <"$File_Process/File_ProcessERR.CFG"

			# Update Status and display on screen
			arr[$choice]=$estatus
			echo "OPTION: $choice     STATUS: $estatus"

			# Write to log file
			echo "*** LOG DETAIL ****" >>$LOG_NAME
			cat joblog >>$LOG_NAME
			echo `date` "$USER   PROCESS ENDING FOR OPTION: $choice     STATUS $estatus
**************************
			" >>$LOG_NAME

		# Break if FAIL
		if [ $opt = "A" -a $choice -le 19 -a $estatus = "1" ]
		then
			tag=$( tail -n 1 $FILE_HOME/joblog )
			echo $tag
			choice=` expr $choice + 1 `
		else
			break
		fi
done
echo "1 ${arr[1]}" > $STATUS_FILE
cat $LOG_NAME >> $CLOG_NAME
echo "EXITING. THANK YOU"
# --- End of Main Program ---
#echo `date`
 echo -e "\033[33;32m `date`"
