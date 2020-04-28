## Utility to setup containerized ML projects

Simply clone the repository in your project's folder

```bash
git clone https://github.com/stamate/container.git
```

edit Dockerfile to have your required image and OS settings

edit Makefile to use your specific data folder and/or GPUs, or pass them as arguments to make. These are DATA= and GPU=

start the container

```bash
make lab DATA=/mnt/data GPU=0,2
```

You will have a new shell inside the container and all your files will be in the /lab folder. Data will be in /lab/data.

Enjoy!
