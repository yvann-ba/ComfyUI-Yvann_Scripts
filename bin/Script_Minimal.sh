#--------------------------------------COMFYUI INSTALLATION--------------------------------------
cd /workspace

apt update -y
apt upgrade -y

apt-get install python3.11 -y
apt install python3.10-venv -y

git clone https://github.com/comfyanonymous/ComfyUI
cd /workspace/ComfyUI
python3 -m venv venv
source venv/bin/activate

apt-get install ffmpeg -y
apt-get install -y libgl1-mesa-glx

pip install torch==2.0.1+cu118 torchvision==0.15.2+cu118 torchaudio==2.0.2 --index-url https://download.pytorch.org/whl/cu118
pip install xformers==0.0.20
pip install opencv-python
pip install safetensors
pip install trampoline
pip install -r requirements.txt --no-deps
pip install einops transformers>=4.25.1 safetensors>=0.3.0 aiohttp accelerate pyyaml Pillow scipy tqdm psutil kornia
pip install git+https://github.com/kornia/kornia --upgrade
#--------------------------------------COMFYUI INSTALLATION--------------------------------------


#Add the path of your drive folder that you import
# Create extra_model_paths.yaml to include paths from Google Drive
echo -e "comfyui:\n
base_path: path/to/comfyui/
vae: /models/vae\n
upscale_models: /models/upscale_models\n
loras: /models/loras\n
controlnet: /models/controlnet\n
checkpoints: /models/checkpoints\n
animatediff_models: /models/animatediff_models\n
ipadapter: /models/ipadapter\n
clip_vision: /models/clip_vision" > /workspace/ComfyUI/extra_model_paths.yaml

# Navigate to the custom_nodes directory and clone repositories
cd /workspace/ComfyUI/custom_nodes
git clone https://github.com/ltdrdata/ComfyUI-Manager.git

# Setup start.sh script
echo -e '#!/bin/bash\n\nsleep 10\napt update\napt install psmisc\nfuser -k 3000/tcp\ncd /workspace/ComfyUI/venv\nsource bin/activate\ncd /workspace/ComfyUI\npython main.py --listen 0.0.0.0 --port 3000' > /start.sh
chmod +x /start.sh

# Start ComfyUI on port 3000
apt update
apt install psmisc
fuser -k 3000/tcp
cd /workspace/ComfyUI/venv
source bin/activate
cd /workspace/ComfyUI
python main.py --listen 0.0.0.0 --port 3000
