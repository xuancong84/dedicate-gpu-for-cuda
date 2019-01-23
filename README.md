# dedicate-gpu-for-cuda

Nowadays, most of modern desktop and laptop motherboards have a built-in Intel GPU for graphics display. In Ubuntu, if the desktop display uses Nvidia GPU (`prime-select nvidia`), then:

1. when you are running CUDA simulations, you will often experience some lags or latency when manipulating with desktop items, e.g., switching to another desktop, maximizing/minimizing windows.
2. you have less graphics memory for CUDA simulations since many desktop windows programs (including Windows itself) uses GPU memory for graphics acceleration.


How to configure iGPU for display and NVIDIA GPU for CUDA?
How to configure Intel graphics card for desktop display and NVIDIA GPU for CUDA?

Solution:
1. To start the desktop environment using Intel graphics card, you first need to run `sudo prime-select intel` and reboot (or logout and login again)
2. Every time after reboot, run the script, start-nvidia.sh , then you will be able to run CUDA programs. You can put it in your $HOME/bin folder.

Since NVIDIA updates their driver frequently, the location and filename of the kernel driver can change from /lib/modules/4.15.0-43-generic/updates/dkms/nvidia.ko at any time. Moreover, its dependency driver ipmi_msghandler might also change.
You might need to modify the script accordingly.
