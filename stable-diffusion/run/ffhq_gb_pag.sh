export CUDA_VISIBLE_DEVICES='1'

pag_scale=5.0
omega=0.1
gamma=0.01
file_name='00006.jpg'

python scripts/inverse.py \
    --file_id=$file_name \
    --task_config='configs/gaussian_deblur_config_psld.yaml' \
    --pag_scale=$pag_scale \
    --omega=$omega \
    --gamma=$gamma \
    --input_layer='8' \
    --skip_low_res \


