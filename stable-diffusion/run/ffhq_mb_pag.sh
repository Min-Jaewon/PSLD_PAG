export CUDA_VISIBLE_DEVICES='3'

pag_scale=4.0
omega=0.15
gamma=0.015
file_name='00000.jpg'

python scripts/inverse.py \
    --file_id=$file_name \
    --task_config='configs/motion_deblur_config_psld.yaml' \
    --pag_scale=$pag_scale \
    --omega=$omega \
    --gamma=$gamma \
    --input_layer='8' \
    --skip_low_res \



