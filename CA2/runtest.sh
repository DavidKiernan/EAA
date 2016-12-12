#!/bin/bash

# Done to make changes to the files easier to maintain
SYNTHF="synthetic.dat";
TEMPFILE="CPUdata.txt";
OUTFILE="results.dat";

# prints the heading of the results.dat with 8 spaces between in caption
printf "%-8s %-8s %-8s" "C0" "N" "IDLE" > $OUTFILE;

for i in {1..50}
do
	echo "User $i" 
	echo "Running Loadtest";

	# loadtest runs for 10 seconds
	timeout 10 ./loadtest $i &
	
	#-P 0 is for 1 core if multi core processor
	# 1 10 will take % CPU idle every 1 second for a duration of 10 counts
	# This will automaticaly provide an average for % idle for the 10 secs
	# That the loadtest is running and write it to CPUdata file which is overwritten for every iteration

	echo "Running MPSTAT";
	mpstat -P 0 1 10  > $TEMPFILE
	
	 #Calculate Co by taking the number of lines within synthetic.dat

	transactions=`wc -l < $SYNTHF`
	echo "Co: $transactions";
	
	#Get avg idle as mpstat is taking a "picture" of cpu idle time every second need for duration
	# of loadtest so need to avgerage it from CPUdata file .

    	CPUAverage=`awk '/Average/ {print $12}' $TEMPFILE`
    	echo "AVG CPU Idle $CPUAverage %";

 	# Appending to results.dat ensuting that there is 8 spaces between each component
	printf "\%-8s %-8s %-8s" "$transactions"  "$i"  "$CPUAverage" >> $OUTFILE
  
done




