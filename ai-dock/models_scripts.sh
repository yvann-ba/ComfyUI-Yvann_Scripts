cd /workspace/ComfyUI/models/

cd checkpoint
wget -O DreamShaperXL_Turbo_v2_1.safetensors https://huggingface.co/Lykon/dreamshaper-xl-v2-turbo/resolve/main/DreamShaperXL_Turbo_v2_1.safetensors?download=true

cd ../vae
wget -O fixFP16ErrorsSDXLLowerMemoryUse_v10.safetensors https://huggingface.co/madebyollin/sdxl-vae-fp16-fix/resolve/main/sdxl.vae.safetensors?download=true

cd ../animatediff_models
wget -O hsxl_temporal_layers.f16.safetensors https://huggingface.co/hotshotco/Hotshot-XL/resolve/main/hsxl_temporal_layers.f16.safetensors?download=true

cd ../ipadapter
wget -O ip-adapter_sdxl_vit-h.safetensors https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/ip-adapter_sdxl_vit-h.safetensors?download=true

cd ../clip_vision
wget -O CLIP-ViT-H-14-laion2B-s32B-b79K.safetensors https://huggingface.co/h94/IP-Adapter/resolve/main/models/image_encoder/model.safetensors

cd ../controlnet
mkdir XL
cd XL
wget -O XinsirTileXL.safetensors https://huggingface.co/xinsir/controlnet-tile-sdxl-1.0/blob/main/diffusion_pytorch_model.safetensors?download=true
wget -O XinsirDepthXL https://huggingface.co/xinsir/controlnet-depth-sdxl-1.0/blob/main/diffusion_pytorch_model.safetensors?download=true
wget -O XinsirCannyXL.safetensors https://huggingface.co/xinsir/controlnet-canny-sdxl-1.0/blob/main/diffusion_pytorch_model_V2.safetensors?download=true
cd ..

cd ../upscale_models
wget -O 4x-UltraSharp.pth https://huggingface.co/lokCX/4x-Ultrasharp/resolve/main/4x-UltraSharp.pth?download=true
