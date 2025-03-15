## File Structure
```shell
.
├── README  # * Instruction to this repo
├── requirements  # * Requirements for Conda Environment
├── data  # * Place data split & preprocessed data
├── models  # * Codes for FakingRecipe Model
├── utils  # * Codes for Training and Inference
├── main  # * Codes for Training and Inference
└── run  # * Codes for Training and Inference  
```

## Dataset
We conduct experiments on two datasets: FakeSV and FakeTT. 
### FakeSV
FakeSV is the largest publicly available Chinese dataset for fake news detection on short video platforms, featuring samples from
Douyin and Kuaishou, two popular Chinese short video platforms. Each sample in FakeSV contains the video itself, its title, comments, metadata, and publisher profiles. For the details, please refer to [this repo](https://github.com/ICTMCG/FakeSV).
### FakeTT
FakeTT is English dataset for a comprehensive evaluation in English-speaking contexts, Each sample in FakeTT contains the video itself, its title, comments, metadata, and publisher profiles. For the details, please refer to [this repo](https://github.com/ICTMCG/FakingRecipe). 

## Environment
```shell
  conda create -n aaa python=3.9
  conda activate aaa
  pip install -r requirements.txt
```
## Data Preprocess
- To extract OCR, we use [PaddleOCR](https://github.com/PaddlePaddle/PaddleOCR).
- To seg video clips, we use [TransNetv2](https://github.com/soCzech/TransNetV2).
- To facilitate reproduction, the author of FakeTT and FakeSV provide preprocessed features, which you can download from [this link](https://pan.baidu.com/s/1z4taz_nOe_Uq5IANlPyOYw?pwd=ydp9)(pwd: ydp9) and place the '/fea' directory under FakingRecipe (at the same level as main.py). Additionally, we offer [checkpoints](https://pan.baidu.com/s/1BI7hDnDbrpQlWBb6-dslYQ?pwd=qkqj) (pwd: qkqj) for two datasets, which you can similarly place the '/provided_ckp' directory under FakingRecipe.
```shell
  # To classify the data into different domains
  python domain_classify.py
```
## Quick Start
You can train and test by following code:
 ```shell
  # Infer the examples from FakeSV
  python main.py --dataset fakesv --mode train --inference_ckp ./provided_ckp/FakingRecipe_fakesv --dg --diffusion --alpha 0.1 --beta 3 --gamma 0.05 --lr 5e-5
  # Infer the examples from FakeTT
  python main.py --dataset fakett --mode train --inference_ckp ./provided_ckp/FakingRecipe_fakett --dg --diffusion --alpha 0.1 --beta 3 --gamma 0.05 --lr 1e-3
  ```

