## Environment Setting
PSLD environment
```
conda create -n psld python=3.8
conda activate psld
conda install -c pytorch cudatoolkit=11.3 pytorch=1.11.0 torchvision=0.12.0 numpy=1.19.2

cd stable-diffusion
pip install -r requirements.txt
pip install omegaconf
```
DPS environment
```
cd ../diffusion-posterior-sampling
pip install -r requirements.txt
```

External codes for DPS environment
```
cd diffusion-posterior-sampling
git clone https://github.com/VinAIResearch/blur-kernel-space-exploring bkse
git clone https://github.com/LeviBorodenko/motionblur motionblur
```

## Download Pretrained Model
Link : <https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/v1-5-pruned-emaonly.ckpt>

Download the weights from the link and place them in the ```stable-diffusion/models/ldm/stable-diffusion-v1``` named as ```model.ckpt```

## File to run
```task : {bip, gb, mb, sr8}```

```
cd stable-diffusion
- bash run/ffhq_{task}_pag.sh  # for ffhq dataset
- bash run/imagenet_{task}_pag.sh # for imagenet dataset
```

## Struture of result
```
stable-diffusion/outputs/{task} # bip, gb, mb, sr8
├── samples
│    └─{file_id}.png    # sample images
└── y_n
     └─y_n_{file_id}.png    # y_n (degraded) images
```