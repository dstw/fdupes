#!/bin/bash

[ ! -d recursed_a ] && mkdir recursed_a

[ -f recursed_a/five ] && rm -f recursed_a/five && \
echo "five" > recursed_a/five || echo "five" > recursed_a/five

[ -f recursed_a/one ] && rm -f recursed_a/one && \
echo "one" > recursed_a/one || echo "one" > recursed_a/one

[ -f recursed_a/two ] && rm -f recursed_a/two && \
echo "two" > recursed_a/two || echo "two" > recursed_a/two

[ ! -d recursed_b ] && mkdir recursed_b

[ -f recursed_b/four ] && rm -f recursed_b/four && \
echo "four" > recursed_b/four || echo "four" > recursed_b/four

[ -f recursed_b/one ] && rm -f recursed_b/one && \
echo "one" > recursed_b/one || echo "one" > recursed_b/one

[ -f recursed_b/three ] && rm -f recursed_b/three && \
echo "three" > recursed_b/three || echo "three" > recursed_b/three

[ -f recursed_b/two_plus_one ] && rm -f recursed_b/two_plus_one && \
echo "three" > recursed_b/two_plus_one || echo "three" > recursed_b/two_plus_one

[ -f twice_one ] && rm -f twice_one && \
echo "two" > twice_one || echo "two" > twice_one

[ -f two ] && rm -f two && \
echo "two" > two || echo "two" > two

[ -f with\ spaces\ a ] && rm -f with\ spaces\ a && \
echo "with spaces" > with\ spaces\ a || echo "with spaces" > with\ spaces\ a

[ -f with\ spaces\ b ] && rm -f with\ spaces\ b && \
echo "with spaces" > with\ spaces\ b || echo "with spaces" > with\ spaces\ b

[ -f zero_a ] && rm -f zero_a && touch zero_a || touch zero_a

[ -f zero_b ] && rm -f zero_b && touch zero_b || touch zero_b

[ -h symlink_dir ] && rm -f symlink_dir && \
ln -s recursed_a symlink_dir || ln -s recursed_a symlink_dir

[ -h symlink_two ] && rm -f symlink_two && \
ln -s two symlink_two || ln -s two symlink_two

[ -f nine_upsidedown ] && rm -f nine_upsidedown && \
echo "six" > nine_upsidedown || echo "six" > nine_upsidedown
