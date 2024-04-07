export CUDA_VISIBLE_DEVICES='2'

pag_scale=4.0
omega=0.7
gamma=0.07
file_name='00000.jpg'

python scripts/inverse.py \
    --file_id=$file_name \
    --task_config='configs/super_resolution_config_psld_8.yaml' \
    --pag_scale=$pag_scale \
    --omega=$omega \
    --gamma=$gamma \
    --input_layer='8' \
    --skip_low_res \


