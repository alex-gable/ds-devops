
# CUDA On Ubuntu

## Drivers and CUDA toolkit

*TURN OFF SECURE BOOT*
This is a UFEIF BIOS feature that prevents unsigned drivers from running.  

Check Version of Hardware and Drivers
```
ubuntu-drivers devices
#Graphics Card Info as well
lspci | egrep 'VGA|3D'
sudo lshw -c display
```
Install Driver
```
sudo ubuntu-drivers autoinstall
#OR
sudo apt install nvidia-driver-390
```
Select Nvdia (vs Intel)
```
sudo prime-select nvidia
```

Install CUDA toolkit
```
sudo apt install nvidia-cuda-toolkit
```

Run This to Get Information on Drivers and CUDA
```
nvidia-smi
nvcc --version
```

Get Nsight Profiling Application
https://developer.nvidia.com/nsight-graphics
(There is integration with Visual Studio.)

## Driver Version Compatibility

If you run into runtime compatibility issue with CUDA Tensorflow

```
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo ubuntu-drivers devices
```
You will see the updated driver - ```nvidia-driver-430```
This should let you use a newer CUDA for cuDNN
If you run into trouble with dependiencies on the new drivers
```
sudo apt install libnvidia-cfg1-396 xserver-xorg-video-nvidia-396 nvidia-driver-396
```

### cuDNN
The NVIDIA CUDA® Deep Neural Network library (cuDNN) is a GPU-accelerated library of primitives for deep neural networks. cuDNN provides highly tuned implementations for standard routines such as forward and backward convolution, pooling, normalization, and activation layers.


The following NVIDIA® software must be installed on your system:

NVIDIA® GPU drivers —CUDA 10.0 requires 410.x or higher.
CUDA® Toolkit —TensorFlow supports CUDA 10.0 (TensorFlow >= 1.13.0)
CUPTI ships with the CUDA Toolkit.
cuDNN SDK (>= 7.4.1)
(Optional) TensorRT 5.0 to improve latency and throughput for inference on some models.


## Tensorflow Setup

Remove old non CUDA versions.  This is oevrkill but I removed everything

```
conda remove tensorflow tensorboard tensorflow-base tensorflow-estimator
```

Install
```
conda install -c anaconda tensorflow-gpu
```

Test
```
python -c "import tensorflow as tf; print(tf.contrib.eager.num_gpus())"
```



##GCP Setup
Try the marketplace
UPDATE

```
echo "Checking for CUDA and installing."
# Check for CUDA and try to install.
if ! dpkg-query -W cuda-9-0; then
  # The 16.04 installer works with 16.10.
  curl -O http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_9.0.176-1_amd64.deb
  dpkg -i ./cuda-repo-ubuntu1604_9.0.176-1_amd64.deb
  apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub
  sudo apt-get update
  sudo apt-get install cuda-9-1 -y
fi
# Enable persistence mode
nvidia-smi -pm 1
```
