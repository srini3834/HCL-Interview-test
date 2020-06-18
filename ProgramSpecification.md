# HCL-Interview-test


#Program :1 

To return leaves from right to left in ordered binary execution,we have declared root node and right chile node and left child node,
the starting of program will check will reach until it finds the leaves in right sub tree and prints the value,same way it will reach upto leaves in left sub tree and print the end of the leaves in order binary tree.


#program :2

to process the 100 files at a time from SFTP server and load it in oracle database.

Design system:

1. Env.sh file will have all details of environment details (server location and ip address and oracle schema user name and password)
2. main.sh will be called out as a starting of file porcessing,once we enter valid option for file porcessing ,the designed system will go to the file which placed under particular location and it will run at a time 100 head files and process the files and load in database and move the processed file in processed folder.
3.file_loader.sh will check paramter validation
4. Note: Have attached high level design of the system.
5.if any error happended while processing the file it will captured in log files.

#program 3:

In BFS , root node will be head and right and left node will default to null as starting, we have used queue data struture.
starting from root node,it will check root of right sub tree is not null and it will be added to queue index and same way for left sub tree.it print the data by direct storing the refrence of both left and right sub tree.



