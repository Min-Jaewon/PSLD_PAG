export CUDA_VISIBLE_DEVICES='7'

scale=5.0
omega=0.5
gamma=0.05
data_path='path/to/data' 
output_path='result/sr8'

# (min,max)_count = 생성할 이미지 번호
# min_count ~ max_count-1 까지 생성

python scripts/inverse_batch.py \
    --task_config='configs/super_resolution_config_psld_8.yaml'  \
    --data_path="${data_path}" \
    --adg_scale=$scale \
    --drop_rate=1.0 \
    --input_drop=8 \
    --drop_self \
    --omega=$omega \
    --gamma=$gamma \
    --outdir="${output_path}" \
    --min_count=500 \
    --skip_low_res;
    