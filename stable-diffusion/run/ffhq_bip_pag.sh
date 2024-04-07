export CUDA_VISIBLE_DEVICES='0' 

pag_scale=4.0
omega=0.15
gamma=0.015
file_name='00006.jpg'

python scripts/inverse.py \
    --file_id=$file_name \
    --task_config='configs/box_inpainting_config_psld.yaml' \
    --inpainting=1 \
    --general_inverse=0 \
    --pag_scale=$pag_scale \
    --omega=$omega \
    --gamma=$gamma \
    --input_layer='8' \
    --skip_low_res \




