#!/bin/bash
#SBATCH --job-name=ppl_mRoberta
#SBATCH -D .
#SBATCH -A bsc14
#SBATCH --qos=acc_debug
#SBATCH --output=logs/ce_train_%j.out
#SBATCH --error=logs/ce_train_%j.err
#SBATCH --ntasks=1
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=32
#SBATCH --time=2:00:00

source venv/bin/activate

/gpfs/projects/bsc14/code/lm-pseudoperplexity-evaluation/venv/bin/python ppl.py \
    --model "/gpfs/projects/bsc14/abecerr1/hub/mRoBERTa_newtok" \
    --csv_path "data/data/paraclite.csv" \
    --output_path "output/mRoBERTa_newtok" \
    --batch_size 32 \
    --language "es" \
    --mask_token_id 103 \
    --pad_token_id 1

# /gpfs/projects/bsc14/code/lm-pseudoperplexity-evaluation/venv/bin/python ppl.py \
#     --model "/gpfs/projects/bsc14/abecerr1/hub/mRoBERTa_newtok" \
#     --csv_path "data/data/paraclite.csv" \
#     --output_path "tmp/mRoBERTa_newtok" \
#     --batch_size 32 \
#     --language "es"