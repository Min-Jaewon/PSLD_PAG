export CUDA_VISIBLE_DEVICES='2'

scale=6.0
omega=0.1
gamma=0.01
data_path='path/to/data' 
output_path='result/gb'

# (min,max)_count = 생성할 이미지 번호
# min_count ~ max_count-1 까지 생성

python scripts/inverse_batch.py \
    --task_config='configs/gaussian_deblur_config_psld.yaml'  \
    --data_path="${data_path}" \
    --adg_scale=$scale \
    --drop_rate=1.0 \
    --input_drop=8 \
    --drop_self \
    --omega=$omega \
    --gamma=$gamma \
    --outdir="${output_path}" \
    --max_count=500 \
    --skip_low_res;

