export CUDA_VISIBLE_DEVICES='3'

pag_scale=5.0
omega=0.3
gamma=0.03
file_name='ILSVRC2012_val_00000003.JPEG'

python scripts/inverse.py \
    --file_id=$file_name \
    --task_config='configs/motion_deblur_config_psld.yaml' \
    --pag_scale=$pag_scale \
    --omega=$omega \
    --gamma=$gamma \
    --input_layer='8' \
    --skip_low_res \



