from pathlib import Path
from skimage.metrics import peak_signal_noise_ratio
from tqdm import tqdm
import torch.nn.functional as f
import matplotlib.pyplot as plt
import lpips
import numpy as np
import torch
import os
import cv2

device = 'cuda'
loss_fn_vgg = lpips.LPIPS(net='vgg').to(device)

task = 'SR'
factor = 4
sigma = 0.1
scale = 1.0


label_root = Path(f'FFHQ/ffhq_256_1k')

delta_recon_root = Path(f'FFHQ/ffhq_256_1k_val/samples')
normal_recon_root = Path(f'FFHQ/ffhq_256_1k_val/samples')

psnr_delta_list = []
psnr_normal_list = []

lpips_delta_list = []
lpips_normal_list = []
with torch.no_grad():
    for idx in tqdm(range(1000)):
        fname = str(idx).zfill(5)

        label = plt.imread(os.path.join(label_root , f'{fname}.jpg'))[:, :, :3]
        delta_recon = plt.imread(os.path.join(delta_recon_root , f'{fname}.png'))[:, :, :3]
        normal_recon = plt.imread(os.path.join(normal_recon_root  ,f'{fname}.png'))[:, :, :3]
        
        delta_recon=cv2.resize(delta_recon, dsize=(256,256))
        normal_recon=cv2.resize(normal_recon, dsize=(256,256))

        psnr_delta = peak_signal_noise_ratio(label, delta_recon)
        psnr_normal = peak_signal_noise_ratio(label, normal_recon)
        psnr_delta_list.append(psnr_delta)
        psnr_normal_list.append(psnr_normal)
        delta_recon = torch.from_numpy(delta_recon).permute(2, 0, 1).to(device)
        normal_recon = torch.from_numpy(normal_recon).permute(2, 0, 1).to(device)
        label = torch.from_numpy(label).permute(2, 0, 1).to(device)

        delta_recon = delta_recon.view(1, 3, 256, 256) * 2. - 1.
        normal_recon = normal_recon.view(1, 3, 256, 256) * 2. - 1.
        label = label.view(1, 3, 256, 256) * 2. - 1.

        delta_d = loss_fn_vgg(delta_recon, label)
        normal_d = loss_fn_vgg(normal_recon, label)

        lpips_delta_list.append(delta_d)
        lpips_normal_list.append(normal_d)

    psnr_delta_avg = sum(psnr_delta_list) / len(psnr_delta_list)
    lpips_delta_avg = sum(lpips_delta_list) / len(lpips_delta_list)

    psnr_normal_avg = sum(psnr_normal_list) / len(psnr_normal_list)
    lpips_normal_avg = sum(lpips_normal_list) / len(lpips_normal_list)

    print(f'Delta PSNR: {psnr_delta_avg}')
    print(f'Delta LPIPS: {lpips_delta_avg}')

    print(f'Normal PSNR: {psnr_normal_avg}')
    print(f'Normal LPIPS: {lpips_normal_avg}')