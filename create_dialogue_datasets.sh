#!/usr/bin/env bash
cd data

python make_conv_data.py \
  --conversations_path ./dialogue/dialogues.csv \
  --output_path ./dialogue/music \
  --subreddit 'musicsuggestions'

python transform_redial_data.py

# make_conv_data.py \
#  --conversations_path ./dialogue/redial_dialogues.csv \
#  --output_path ./dialogue/redial \
#  --subreddit 'all'