cd /workspace/ComfyUI/models/

cd CogVideo/loras
wget -O CogVideoX-Fun-V1.1-5b-InP-MPS.safetensors https://huggingface.co/alibaba-pai/CogVideoX-Fun-V1.1-Reward-LoRAs/resolve/main/CogVideoX-Fun-V1.1-5b-InP-MPS.safetensors?download=true

cd ../clip
wget -O t5xxl_fp8_e4m3fn.safetensors https://huggingface.co/mcmonkey/google_t5-v1_1-xxl_encoderonly/resolve/main/t5xxl_fp8_e4m3fn.safetensors?download=true

cd ../..