for var in "$@"
do
    echo "Running $var on test cases"
    for i in $(seq 3) 
    do
        echo "Running test case $i:"
       
        cat input$i.txt | python3 $var > user_output$i.txt 2>error_files$i.txt
        if [ $? -eq 0 ]
        then
        	echo "Code ran without run-time error"
       		if [[ $(diff user_output$i.txt output$i.txt) ]] 
        	then
            		echo "Test case $i failed"
            		echo "Expected output"
            		cat output$i.txt
            		echo "User output: "
            		cat user_output$i.txt
        	else
            		echo "Test case $i passed"
        	fi
        else
        	echo "Code has run-time errors"
        	cat error_files$i.txt
        fi
       
        echo "--------------------------------------------------------------"
    done
    echo "================================================================="
done
