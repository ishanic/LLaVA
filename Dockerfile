# FROM pytorch/pytorch:2.1.0-cuda12.1-cudnn8-runtime
# FROM nvcr.io/nvidia/pytorch:23.09-py3
FROM nvcr.io/nvidia/cuda:11.7.1-devel-ubuntu20.04
ENV TZ=America/Los_Angeles
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update && apt upgrade -y
RUN apt install software-properties-common -y
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get update -y && apt-get install -y python3.10 python3.10-distutils curl
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN ln -snf /usr/bin/python3.10 /usr/bin/python
RUN python get-pip.py
RUN apt-get install -y git
# RUN pip3 install fschat
RUN git clone https://github.com/haotian-liu/LLaVA.git
WORKDIR LLaVA
# RUN cd LLaVA
RUN pip install --upgrade pip
RUN pip install -e .
RUN pip install ninja
RUN pip install flash-attn --no-build-isolation
# RUN pip uninstall -y transformer-engine
# RUN pip install git+https://github.com/NVIDIA/TransformerEngine.git@stable

# RUN pip install python==3.10
# RUN pip install einops
# RUN pip install fastapi
# RUN pip install gradio==3.35.2
# RUN pip install markdown2[all]
# RUN pip install numpy
# RUN pip install requests
# RUN pip install sentencepiece
# RUN pip install tokenizers>=0.12.1
# RUN pip install torch==2.0.1
# RUN pip install torchvision==0.15.2
# RUN pip install uvicorn
# RUN pip install wandb
# RUN pip install shortuuid
# RUN pip install httpx==0.24.0
# RUN pip install deepspeed==0.9.5
# RUN pip install peft==0.4.0
# RUN pip install transformers==4.31.0
# RUN pip install accelerate==0.21.0
# # RUN pip install bitsandbytes==0.41.0
# RUN pip install bitsandbytes-cuda117
# RUN pip install scikit-learn==1.2.2
# RUN pip install sentencepiece==0.1.99
# RUN pip install einops==0.6.1
# RUN pip install einops-exts==0.0.4 
# RUN pip install timm==0.6.13
# RUN pip install gradio_client==0.2.9    
# RUN pip install azureml-defaults    
# RUN pip install ninja
# RUN apt-get -y update
# RUN apt-get -y install git
# ENV CUDA_HOME=/usr/local/cuda
# RUN pip install flash-attn 
# RUN pip install azureml-sdk
# RUN pip install azureml

# # ENV FORCE_CUDA="1"
# # This will build detectron2 for all common cuda architectures and take a lot more time,
# # because inside `docker build`, there is no way to tell which architecture will be used.
# # ENV TORCH_CUDA_ARCH_LIST="Kepler;Kepler+Tesla;Maxwell;Maxwell+Tegra;Pascal;Volta;Turing"
# # RUN git clone https://github.com/facebookresearch/detectron2.git && cd detectron2 && pip install -v .

# # # pytorch3d
# # RUN git clone https://github.com/facebookresearch/pytorch3d.git && cd pytorch3d && pip install -v .
# # RUN git clone https://github.com/facebookresearch/meshrcnn.git && cd meshrcnn && pip install -v .

