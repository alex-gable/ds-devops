#sudo apt update && sudo apt upgrade -y
sudo apt-get update

sudo apt-get -y install git-all
sudo apt-get -y install build-essential
sudo apt-get -y install make
sudo apt-get -y install libtool m4 automake
sudo apt-get -y install autoconf
sudo apt-get -y install tmux
sudo apt-get -y install texlive-*

wget https://repo.anaconda.com/archive/Anaconda3-5.3.1-Linux-x86_64.sh
bash Anaconda3-5.3.1-Linux-x86_64.sh
echo "ready"
#LOGOUT AND BACK IN
conda upgrade -y setuptools
conda remove -y --name snowflakes --all
conda create -y -n snowflakes python=3.7

conda activate snowflakes
conda install -y pip
conda install -y Flake8
conda install -y sphinx
conda install -y pytest-cov pytest
pip install codecov
conda install -y tensorflow
conda install -y IPython
conda install -y jupyter
conda install -y keras
conda install -y -c quantopian pandas-datareader
conda install -y matplotlib
conda install -y scipy
conda install -y scikit-learn
conda install -y numpy
conda install -y Cython
#Misc Packages for some of the deep learning examples
pip install --upgrade tensorflow-probability

conda install -y seaborn
conda install -y dill

#  L1 and Convex Optimization
pip install  osqp
conda install -y cvxopt
#cvxpy module is a nice wrapper around cvxopt that follows paradigm of a disciplined convex programming.
conda install -y -c conda-forge lapack
conda install -y -c cvxgrp cvxpy

#https://pymanopt.github.io/
#Riemannian Optimisation with Pymanopt for Inference in MoG models
#https://pymanopt.github.io/MoG.html
pip install -y --user pymanopt

conda install -y -c conda-forge autograd

#PyEMD is a Python wrapper for Ofir Pele and Michael Werman's implementation of the Earth Mover's Distance that allows it to be used with NumPy
conda install -y pyemd
conda install -y -c conda-forge pot

pip install  dit

conda install -y pillow #Imaging - from PIL import Image

#time-freq
git clone https://github.com/scikit-signal/pytftb
cd pytftb
pip install -r requirements.txt
python setup.py install
cd ~

git clone https://github.com/chokkan/liblbfgs.git
cd liblbfgs/
./autogen.sh
./configure
make
sudo make install
cd ~

git clone https://rtaylor@bitbucket.org/rtaylor/pylbfgs.git
cd pytftb/
python setup.py install

conda install -y pystan

conda install -y -c conda-forge google-cloud-storage

#NLP
conda install -y gensim
conda install -y nltk

conda install -y spacy
python -m spacy download en

pip install pyLDAvis

conda activate snowflakes

echo  '
conda activate snowflakes
'  >> ~/.bashrc

#Jupyter
cd $HOME
mkdir certs
cd certs
openssl req -x509 -nodes -days 365 -newkey rsa:1024 -subj "/C=US/ST=IL/L=Chicago" -keyout mycert.pem -out mycert.pem
jupyter notebook --generate-config

JUPYTER_CONFIG='/home/bruce/.jupyter/jupyter_notebook_config.py'

echo "c = get_config()">>$JUPYTER_CONFIG
echo "# Notebook config this is where you saved your pem cert">>$JUPYTER_CONFIG

echo "c.NotebookApp.certfile = u'/home/bruce/certs/mycert.pem'">>$JUPYTER_CONFIG

echo "# Run on all IP addresses of your instance">>$JUPYTER_CONFIG
echo "c.NotebookApp.ip = '*'">>$JUPYTER_CONFIG
echo "# Don't open browser by default">>$JUPYTER_CONFIG
echo "c.NotebookApp.open_browser = False">>$JUPYTER_CONFIG
echo "# Fix port to 8080">>$JUPYTER_CONFIG
echo "c.NotebookApp.port = 8080">>$JUPYTER_CONFIG
echo "c.NotebookApp.allow_remote_access = True">>$JUPYTER_CONFIG
cd $HOME
tmux
jupyter notebook &
