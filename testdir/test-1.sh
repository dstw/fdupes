#!/bin/bash

SUCCESS_CODE=0

./init.sh
../fdupes -rNd -e twice_one .
[ ! -f ./recursed_a/two ] && [ ! -f ./two ] && [ -f ./twice_one ] && \
SUCCESS_CODE=$(($SUCCESS_CODE+1)) && echo success || echo failure

./init.sh
../fdupes -rNd --prefer twice_one .
[ ! -f ./recursed_a/two ] && [ ! -f ./two ] && [ -f ./twice_one ] && \
SUCCESS_CODE=$(($SUCCESS_CODE+1)) && echo success || echo failure

./init.sh
touch two
../fdupes -rNd -e recursed_a/ .
[ -f ./recursed_a/two ] && [ ! -f ./two ] && [ ! -f ./twice_one ] && \
SUCCESS_CODE=$(($SUCCESS_CODE+1)) && echo success || echo failure

./init.sh
../fdupes -rNd --prefer recursed_a/ .
[ -f ./recursed_a/two ] && [ ! -f ./two ] && [ ! -f ./twice_one ] && \
SUCCESS_CODE=$(($SUCCESS_CODE+1)) && echo success || echo failure

[ $SUCCESS_CODE -eq 4 ] && echo all test success || echo some test failure
