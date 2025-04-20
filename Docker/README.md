# Docker image and container build instruction

## Description:
We'll have an example docker image and container build 
- Based on host: Ubuntu 24.04 host with RTX 4090
- Container env: Ubuntu 22.04, cuda 11.8, cudn8, Python 3.8.5

## Create image
        ./build_image_ub22.04_cuda11.8_Py3.8.5.sh

## Create container based on the above image
        ./create_run_container_ub22.04_cuda11.8_Py3.8.5.sh <volume path on the host>
Above command will create a container and drop into bash terminal of the container.  After typing exit inside it, it'll exit out  of the container and the container will stop

## use the inference example as mentioned in the README.md under main folder
- preparation:
  - preTrained model in best_weight:
    - Download best_weight.zip from the “Upload all pretrained weight” link under main README.md
    - Unzip it to the root folder of the repo. It's needed for inference.py 
  - prepare needed module dependencies
    - restart and get into docker container terminal:

          docker start ub22.04_cuda11.8_Py3.8.5_p8838
          docker exec -it ub22.04_cuda11.8_Py3.8.5_p8838 bash

    - install needed module dependencies:
          
          python3.8 -m venv venv_ub22.04_cuda11.8_Py3.8.5_dcontainer
          source venv_ub22.04_cuda11.8_Py3.8.5_dcontainer/bin/activate
    
          pip install torch==1.8.0+cu111 \
            torchvision==0.9.0+cu111 \
            torchaudio==0.8.0 \
            torchmetrics==0.3.2 \
            -f https://download.pytorch.org/whl/torch_stable.html

          pip install -r requirements_ub22.04_cuda11.8_Py3.8.5-dcontainer.txt

- run inference as below like mentioned in the README.md 

          python inference.py --types midi_like --task ar_va --file_path <path of midi file> 
