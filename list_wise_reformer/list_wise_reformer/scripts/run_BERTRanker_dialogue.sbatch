#!/bin/sh

#SBATCH --partition=general
#SBATCH --qos=long
#SBATCH --time=15:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --gres=gpu:2
#SBATCH --mem-per-cpu=14000
#SBATCH --mail-type=END

#module use /opt/insy/modulefiles
#module load cuda/10.0 cudnn/10.0-7.4.2.24
#source /home/nfs/gustavopenha/env_slice_learning/bin/activate

REPO_DIR=/home/stu15/s3/kf3121/Courses/IR/Project/ConvRecProbingBERT-master

#Either uncomment the following, or call this using run_all_dialogue_baselines.sh
# TASK=music
# TASK=books
# TASK=movies
TASK=redial

for SEED in 42 1 2 3 4
# for SEED in 42
 python run_dialogue_baseline.py --task /home/stu15/s3/kf3121/Courses/IR/Project/ConvRecProbingBERT-master --data_folder /home/stu15/s3/kf3121/Courses/IR/Project/ConvRecProbingBERT-master/data/dialogue/ --seed 42 --ranker bert --output_dir /home/stu15/s3/kf3121/Courses/IR/Project/ConvRecProbingBERT-master/data/output_data/bert4dialogue --early_stopping_steps 100000 --logging_steps 200000 --learning_rate 5e-6 --num_epochs 1 --gpt2_model 'gpt2'

python run_probes.py --task $TASK --probe_type ${PROBE_TYPE} --input_folder /home/stu15/s3/kf3121/Courses/IR/Project/ConvRecProbingBERT-master/data/ ${PROBE_TYPE}/ --output_folder $REPO_DIR/data/output_data/probes/ --number_queries $NUMBER_PROBE_QUERIES --number_candidates 5 --batch_size 64 --probe_technique ${PROBE_TECHNIQUE} --bert_model 'gpt2'

python run_probes.py --task music --probe_type recommendation --input_folder /home/stu15/s3/kf3121/Courses/IR/Project/ConvRecProbingBERT-master/data/recommendation --output_folder /home/stu15/s3/kf3121/Courses/IR/Project/ConvRecProbingBERT-master/data/output_data/probes/ --number_queries 5 --number_candidates 5 --batch_size 64 --probe_technique 'mean-sim' --bert_model 'gpt2'