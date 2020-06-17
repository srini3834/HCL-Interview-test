############# HCL FILE PROCESSING SYSTEM ###############
cd $FILE_HOME/SHELL_FILE
custdt=`date +"%d/%m/%Y"`; export custdt
V_FILE_NAME=''
if [ $1 = "FP" ]
then     
      
       for file in $(ls -p | grep -v / tail -100)
       do
       DTU=`date +"+%Y-%m-%d-%H:%M:%S"`; export DTU   
       sh FILE_LOADER.sh  $FILE_HOME/CTRL_FILE/FP_HCL_EXT.CTL $FILE_HOME/DATA_INFO/FP/DATA_FILE/Perf-1_$DTU.csv $FILE_HOME/DATA_INFO/FP/LOG/Perf-1_$DTU.LOG $FILE_HOME/DATA_INFO/FP/LOG/Perf-1_$DTU.BAD FP_HCL_EXT
       mv $FILE_HOME/DATA_INFO/FP/DATA_FILE/Perf-1_$DTU.csv $FILE_HOME/DATA_INFO/FP/PROCESSED	
       done
else
	echo $1 " job is not present to process."
fi
V_COUNT=$count
V_UPLOAD_TYPE=$1
echo "Upload Type : "$1
