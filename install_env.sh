# PSLD
cd stable-diffusion
conda create -n psld python=3.8
conda activate psld
conda install -c pytorch cudatoolkit=11.3 pytorch=1.11.0 torchvision=0.12.0 numpy=1.19.2
pip install -r requirements.txt
pip install omegaconf

#DPS
cd ../diffusion-posterior-sampling
pip install -r requirements.txt