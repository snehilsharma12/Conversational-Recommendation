--Setup--
Extract the dialogue.rar that is in "data" folder, in place.

--Create an Environment--
python3 -m venv env
source env/bin/activate
pip install -r requirements.txt

--Create dataset--
./download_data.sh

### The redial data is preinstalled a converted for train-test split as the whole process takes around 5 hrs to complete
on the ICL6 machine ###
### If you still want to compute that, uncomment the lines in the followling file and run it ###
./create_dialogue_dataset.sh

--Run the Scripts--
cd list_wise_reformer
pip install -e .
cd list_wise_reformer/script
--for BERT
python run_dialogue_baseline.py --task music \
    --data_folder /home/stu15/s3/kf3121/Courses/IR/Project/ConvRecProbingBERT-master/data/dialogue/ \
    --seed 42 --ranker 'bert' \
    --output_dir /home/stu15/s3/kf3121/Courses/IR/Project/ConvRecProbingBERT-master/data/output_data/bert4dialogue \
    --early_stopping_steps 100000 --logging_steps 200000 --learning_rate 5e-6 --num_epochs 1 --model 'bert-base-uncased'

--for DialoGPT
python run_dialogue_baseline.py --task music \
    --data_folder /home/stu15/s3/kf3121/Courses/IR/Project/ConvRecProbingBERT-master/data/dialogue/ \
    --seed 42 --ranker 'dialo' \
    --output_dir /home/stu15/s3/kf3121/Courses/IR/Project/ConvRecProbingBERT-master/data/output_data/dialo4dialogue \
    --early_stopping_steps 100000 --logging_steps 200000 --learning_rate 5e-6 --num_epochs 1 --model 'dialo'

--Run the augmented data test
--for BERT
python run_dialogue_baseline.py --task redial \
    --data_folder /home/stu15/s3/kf3121/Courses/IR/Project/ConvRecProbingBERT-master/data/dialogue/ \
    --seed 42 --ranker 'bert' \
    --output_dir /home/stu15/s3/kf3121/Courses/IR/Project/ConvRecProbingBERT-master/data/output_data/bert4redial \
    --early_stopping_steps 100000 --logging_steps 200000 --learning_rate 5e-6 --num_epochs 1 --model 'bert-base-uncased'

--for DialoGPT
python run_dialogue_baseline.py --task redial \
    --data_folder /home/stu15/s3/kf3121/Courses/IR/Project/ConvRecProbingBERT-master/data/dialogue/ \
    --seed 42 --ranker 'dialo' \
    --output_dir /home/stu15/s3/kf3121/Courses/IR/Project/ConvRecProbingBERT-master/data/output_data/dialo4redial \
    --early_stopping_steps 100000 --logging_steps 200000 --learning_rate 5e-6 --num_epochs 1 --model 'dialo'

--------------------------------------------
# in main directory:
cd data
python make_conv_data.py --conversations_path ./dialogue/redial_dialogues.csv --output_path ./dialogue/redial --subreddit 'all'

________________________________________________________________________
In collaboration with Kedar Fitwe and Neel Choudhary
