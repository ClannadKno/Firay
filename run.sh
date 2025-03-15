#!/bin/bash

echo "First training Started."
python main.py --dataset fakett --mode train --inference_ckp ./provided_ckp/FakingRecipe_fakett \
  --seed 2025 --dg --diffusion --alpha 0.1 --beta 3 --early_stop 15 --lr 1e-3 --gamma 0.05 --epoches 40 \
  --path_ckp './checkpoints1/' --path_tb "./tensorboard1/" --gpu 0
echo "First training completed."

# w/o DG
echo "Second training Started."
python main.py --dataset fakett --mode train --inference_ckp ./provided_ckp/FakingRecipe_fakett \
  --seed 2025 --diffusion --alpha 0.1 --beta 3 --early_stop 15 --lr 1e-3 --gamma 0.05 --epoches 40 \
  --path_ckp './checkpoints2/' --path_tb "./tensorboard2/" --gpu 0
echo "Second training completed."

# w/o Diffusion
echo "Third training Started."
python main.py --dataset fakett --mode train --inference_ckp ./provided_ckp/FakingRecipe_fakett \
  --seed 2025 --dg --alpha 0.1 --beta 3 --early_stop 15 --lr 1e-3 --gamma 0.05 --epoches 40 \
  --path_ckp './checkpoints3/' --path_tb "./tensorboard3/" --gpu 0

echo "Third training completed."