#########################FILE PROCESSING CHECK###########################
echo "Number Of Parameters: $#"
if [ $# != 5 ]
then
echo "Incorrect number of parameters passed. Please find below parameter details :"
echo "Parameter-1 : Control file"
echo "Parameter-2 : Data file"
echo "Parameter-3 : Log file"
echo "Parameter-4 : Bad file"
echo "Parameter-5 : Table Name"
exit 0
fi
echo "Control File Name : $1"
echo "Data File Name : $2"
echo "Log File Name : $3"
echo "Bad File Name : $4"
echo "Control Table Name : $5"
if [ -e $fileName ]
	then
sqlldr $ORAUID/$ORAPWD@$ORACLE_SID DATA=$2 control=$1 LOG=$3 BAD=$4;
else
		echo 'ERROR: UPLOAD FILE NOT FOUND'
		estatus="FAIL"
			
fi
