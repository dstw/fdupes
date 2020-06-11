#!/bin/bash

SUCCESS_CODE=0

### test fdupes functionality for noninteractive options

### test preserve first file

./init.sh
CMD_TEST="../fdupes -rNd ." && $CMD_TEST
CHECK_SUM=0
CHECK=0
[ -f ./zero_a ] && CHECK=$(($CHECK+1))
echo $CHECK
[ -f ./zero_b ] && CHECK=$(($CHECK+1))
echo $CHECK
[ $CHECK -eq 1 ] && CHECK_SUM=$(($CHECK_SUM+1))
echo $CHECK should 1
echo $CHECK_SUM should 1
CHECK=0
[ -f ./recursed_a/two ] && CHECK=$(($CHECK+1))
echo $CHECK
[ -f ./two ] && CHECK=$(($CHECK+1))
echo $CHECK
[ -f ./twice_one ] && CHECK=$(($CHECK+1))
echo $CHECK
[ $CHECK -eq 1 ] && CHECK_SUM=$(($CHECK_SUM+1))
echo $CHECK should 1
echo $CHECK_SUM should 2
CHECK=0
[ -f ./with\ spaces\ a ] && CHECK=$(($CHECK+1))
echo $CHECK
[ -f ./with\ spaces\ b ] && CHECK=$(($CHECK+1))
echo $CHECK
[ $CHECK -eq 1 ] && CHECK_SUM=$(($CHECK_SUM+1))
echo $CHECK should 1
echo $CHECK_SUM should 3
CHECK=0
[ -f ./recursed_b/one ] && CHECK=$(($CHECK+1))
echo $CHECK
[ -f ./recursed_a/one ] && CHECK=$(($CHECK+1))
echo $CHECK
[ $CHECK -eq 1 ] && CHECK_SUM=$(($CHECK_SUM+1))
echo $CHECK should 1
echo $CHECK_SUM should 4
CHECK=0
[ -f ./recursed_b/two_plus_one ] && CHECK=$(($CHECK+1))
echo $CHECK
[ -f ./recursed_a/three ] && CHECK=$(($CHECK+1))
echo $CHECK
[ $CHECK -eq 1 ] && CHECK_SUM=$(($CHECK_SUM+1))
echo $CHECK should 1
echo $CHECK_SUM should 5
[ $CHECK_SUM -eq 5 ] && SUCCESS_CODE=$(($SUCCESS_CODE+1)) && \
echo \"$CMD_TEST\" success || echo \"$CMD_TEST\" fail

#./init.sh
#CMD_TEST="../fdupes --recurse -Nd ." && $CMD_TEST
#CHECK_SUM=0
#CHECK=0
#[ -f ./zero_a ] && CHECK=$(($CHECK+1))
#[ -f ./zero_b ] && CHECK=$(($CHECK+1))
#[ $CHECK -eq 1 ] && CHECK_SUM=$(($CHECK_SUM+1))
#CHECK=0
#[ -f ./recursed_a/two ] && CHECK=$(($CHECK+1))
#[ -f ./two ] && CHECK=$(($CHECK+1))
#[ -f ./twice_one ] && CHECK=$(($CHECK+1))
#[ $CHECK -eq 1 ] && CHECK_SUM=$(($CHECK_SUM+1))
#CHECK=0
#[ -f ./with\ spaces\ a ] && CHECK=$(($CHECK+1))
#[ -f ./with\ spaces\ b ] && CHECK=$(($CHECK+1))
#[ $CHECK -eq 1 ] && CHECK_SUM=$(($CHECK_SUM+1))
#CHECK=0
#[ -f ./recursed_b/one ] && CHECK=$(($CHECK+1))
#[ -f ./recursed_a/one ] && CHECK=$(($CHECK+1))
#[ $CHECK -eq 1 ] && CHECK_SUM=$(($CHECK_SUM+1))
#CHECK=0
#[ -f ./recursed_b/two_plus_one ] && CHECK=$(($CHECK+1))
#[ -f ./recursed_a/three ] && CHECK=$(($CHECK+1))
#[ $CHECK -eq 1 ] && CHECK_SUM=$(($CHECK_SUM+1))
#[ $CHECK_SUM -eq 5 ] && SUCCESS_CODE=$(($SUCCESS_CODE+1)) && \
#echo \"$CMD_TEST\" success || echo \"$CMD_TEST\" fail
#
#### test preserved file
#
#./init.sh
#CMD_TEST="../fdupes -rNd -e twice_one ." && $CMD_TEST
#[ ! -f ./recursed_a/two ] && [ ! -f ./two ] && [ -f ./twice_one ] && \
#SUCCESS_CODE=$(($SUCCESS_CODE+1)) && \
#echo \"$CMD_TEST\" success || echo \"$CMD_TEST\" fail
#
#./init.sh
#CMD_TEST="../fdupes -rNd --prefer twice_one ." && $CMD_TEST
#[ ! -f ./recursed_a/two ] && [ ! -f ./two ] && [ -f ./twice_one ] && \
#SUCCESS_CODE=$(($SUCCESS_CODE+1)) && \
#echo \"$CMD_TEST\" success || echo \"$CMD_TEST\" fail
#
#./init.sh
#CMD_TEST="../fdupes -rNd -e recursed_a/ ." && $CMD_TEST
#[ -f ./recursed_a/two ] && [ ! -f ./two ] && [ ! -f ./twice_one ] && \
#SUCCESS_CODE=$(($SUCCESS_CODE+1)) && \
#echo \"$CMD_TEST\" success || echo \"$CMD_TEST\" fail
#
#./init.sh
#CMD_TEST="../fdupes -rNd --prefer recursed_a/ ." && $CMD_TEST
#[ -f ./recursed_a/two ] && [ ! -f ./two ] && [ ! -f ./twice_one ] && \
#SUCCESS_CODE=$(($SUCCESS_CODE+1)) && \
#echo \"$CMD_TEST\" success || echo \"$CMD_TEST\" fail
#
#[ $SUCCESS_CODE -ne 6 ] && echo one or more test failed && exit 1 || \
#echo all test success
