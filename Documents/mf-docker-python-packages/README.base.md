Base Environment
=================

Overview
--------
The Base Environment provides a minimal setup with essential Python packages for basic data manipulation. 

Python Version
--------------
- Python 3.8

Installed Packages
------------------
- Numpy: A package for numerical computations in Python.
- Pandas: Tools for data manipulation and analysis.
- Scipy: A package for scientific and technical computing.
- Matplotlib: A plotting library for creating static, animated, and interactive visualizations.

Usage Instructions
------------------
To use the Base Environment Docker image, you can pull the image from Docker Hub and run it as follows:

Pull the Docker Image:
docker pull mfarrolas/mf-docker-python-packages:base

Run the Docker Container:
docker run -it mfarrolas/mf-docker-python-packages:base /bin/bash