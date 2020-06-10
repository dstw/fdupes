#!/bin/bash

SUCCESS_CODE=0

./init.sh
CMD_TEST="../fdupes -rNd -e twice_one ." && $CMD_TEST
[ ! -f ./recursed_a/two ] && [ ! -f ./two ] && [ -f ./twice_one ] && \
SUCCESS_CODE=$(($SUCCESS_CODE+1)) && \
echo \"$CMD_TEST\" success || echo \"$CMD_TEST\" fail

./init.sh
CMD_TEST="../fdupes -rNd --prefer twice_one ." && $CMD_TEST
[ ! -f ./recursed_a/two ] && [ ! -f ./two ] && [ -f ./twice_one ] && \
SUCCESS_CODE=$(($SUCCESS_CODE+1)) && \
echo \"$CMD_TEST\" success || echo \"$CMD_TEST\" fail

./init.sh
CMD_TEST="../fdupes -rNd -e recursed_a/ ." && $CMD_TEST
touch two
[ -f ./recursed_a/two ] && [ ! -f ./two ] && [ ! -f ./twice_one ] && \
SUCCESS_CODE=$(($SUCCESS_CODE+1)) && \
echo \"$CMD_TEST\" success || echo \"$CMD_TEST\" fail

./init.sh
CMD_TEST="../fdupes -rNd --prefer recursed_a/ ." && $CMD_TEST
[ -f ./recursed_a/two ] && [ ! -f ./two ] && [ ! -f ./twice_one ] && \
SUCCESS_CODE=$(($SUCCESS_CODE+1)) && \
echo \"$CMD_TEST\" success || echo \"$CMD_TEST\" fail

[ $SUCCESS_CODE -ne 4 ] && echo one or more test failed && exit 1 || \
echo all test success
