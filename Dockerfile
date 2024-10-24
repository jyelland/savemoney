# Pull base conda image and set configurations:
FROM continuumio/miniconda3:24.7.1-0
RUN conda config --add channels pypi
RUN conda config --add channels bioconda
RUN conda config --add channels conda-forge
RUN conda config --set channel_priority strict
RUN conda config --remove channels defaults

# Install C++ compiler and dependencies:
RUN apt update
RUN apt --yes install build-essential
RUN apt-get --yes install zlib1g-dev

# Make future RUN commands use bash:
SHELL ["/bin/bash", "--login", "-c"]

# Update solvers:
RUN conda install -y conda-forge::conda-libmamba-solver conda-forge::libmamba conda-forge::libmambapy conda-forge::libarchive

# Install savemoney dependencies:
#
# Specifying python and numpy versions, because 
# numpy >=2.0 does not appear to work with savemoney.
#
RUN conda install -y python=3.12.4
RUN conda install -y numpy=1.26.4
RUN conda install -y biopython
RUN conda install -y pandas
RUN conda install -y matplotlib
RUN conda install -y Cython

# Install savemoney:
RUN pip install savemoney

