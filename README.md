## Environment Setting
```sh install_env.sh``` : If it doesn't work, install envrionments manually in the file

External codes for DPS setting.
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
- bash run/ffhq_{task}_pag.sh  # for ffhq dataset
- bash run/imagenet_{task}_pag.sh # for imagenet dataset
```

## Struture of result
```
outputs/{task} # bip, gb, mb, sr8
├── samples
│    └─{file_id}.png    # sample images
└── y_n
     └─y_n_{file_id}.png    # y_n (degraded) images
```