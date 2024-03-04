## Environment Setting
```sh install_env.sh``` : If it doesn't work, install envrionments manually in the file

## FFHQ 256x256 1k validation set
Link : <https://www.kaggle.com/datasets/denislukovnikov/ffhq256-images-only>

```00000.png ~ 00999.png``` are used

## File to run
\# indicate which number of cuda to use
- `bash run/bip_#.sh` for random inpainting task.
- `bash run/gb_#.sh` for Gaussian deblur task. 
- `bash run/mb_#.sh` for motion deblur task.
- `bash run/sr8_#.sh` for super-resolution task. 

500 images per 1 gpu

**Each Sampling requires at least 20GB memory**
## Struture of result
``````
result/{task} # bip, gb, mb, sr8
├── logs
│    └─{file_id}.txt    # fundamental logs
├── samples
│    └─{file_id}.png    # sample images
├── seeds
│    └─{file_id}.pt     # seed information
└── y_n
     └─{file_id}.png    # y_n (degraded) images