#!/bin/bash

set -eo pipefail


source conda.sh
source activate tf-cpu

cd /home/utkarshu/prog/work/broadcast-rl/;

in_file=$1
user_idx=$2
out_dir=$3
N=$4
q=$5
until=$6
epochs=$7
K=$8

python rq-compare.py "${in_file}" "${user_idx}" "${out_dir}" --N $N --q $q --reward top_k_reward --until ${until} --epochs ${epochs} --restore --only-cpu --reward-top-k $K

# time ./rq-compare.py "/NL/redqueen/work/rl-broadcast/users-1k-HR-5-followers-pruned-200-own-posts-trimmed-2.dill" 904 "/NL/crowdjudged/work/rl-broadcast/r_2/" --N 300 --q 100.0  --reward r_2_reward --reward-top-k 1 --until 1000  --epochs 10 --allow-growth
