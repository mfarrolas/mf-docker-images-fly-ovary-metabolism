# mf-docker-python-packages 

This repository contains Docker images for different Python environments, tailored for various scRNA-seq analysis-related tasks .

## Tags and Environments

### Base Environment
Tag: `mfarrolas/mf-docker-python-packages:base`

- Python 3.8
- Numpy, Pandas, Scipy, Matplotlib

## Usage

To pull and use the base image, run:

```bash
docker pull mfarrolas/mf-docker-python-packages:base
docker run -it mfarrolas/mf-docker-python-packages:base /bin/bash
