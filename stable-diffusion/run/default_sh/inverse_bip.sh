export CUDA_VISIBLE_DEVICES='2'
python scripts/inverse.py \
    --file_id='00003.png' \
    --task_config='configs/box_inpainting_config_psld.yaml' \
    --inpainting=1 \
    --general_inverse=0 \
    --gamma=1e-2 \
    --omega=1e-1 \
    --ddim_steps=50 \
    --outdir='outputs/psld-samples-bip'