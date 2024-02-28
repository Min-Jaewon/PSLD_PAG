# psld 기본 환경 세팅
cd stable-diffusion
conda create -n psld python=3.8
conda activate psld
conda install -c pytorch cudatoolkit=11.3 pytorch=1.11.0 torchvision=0.12.0 numpy=1.19.2
pip install -r requirements.txt
pip install omegaconf

# 체크포인트 다운로드
# 최종 위치 : stable-diffusion/models/ldm/stable-diffusion-v1/model.ckpt 
cd models/ldm
mkdir stable-diffusion-v1
cd stable-diffusion-v1
wget https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/v1-5-pruned-emaonly.ckpt
mv v1-5-pruned-emaonly.ckpt model.ckpt

# Inverse Problem Operator 환경 세팅
cd ../../../diffusion-posterior-sampling
pip install -r requirements.txt
git clone https://github.com/VinAIResearch/blur-kernel-space-exploring bkse
git clone https://github.com/LeviBorodenko/motionblur motionblur