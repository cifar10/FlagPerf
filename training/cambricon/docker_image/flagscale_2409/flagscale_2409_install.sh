#!/bin/bash
#!/bin/bash
set -xe
pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
pip3 install regex==2024.5.15 schedule==1.2.2 accelerate==0.31.0 transformers==4.40.1 protobuf==3.20.0
pip3 install pybind11 hydra-core s3fs braceexpand webdataset wandb loguru sentencepiece datasets
pip3 install megatron-energon==2.2.0