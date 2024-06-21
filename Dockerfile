# FROM ghcr.io/rasilab/r_python:1.3.0
# RUN python -m  pip install --upgrade pip 
# RUN pip install savemoney==0.2.17b2 
FROM continuumio/miniconda3:latest

RUN apt-get update && apt-get install build-essential -y

RUN conda install mamba -c conda-forge

RUN mamba install -y -c conda-forge numpy \
	biopython \
  	pandas \
  	matplotlib \
  	Cython \
	conda-build

RUN mamba install -y -c bioconda pyspoa

RUN pip install savemoney==0.2.17b2 
