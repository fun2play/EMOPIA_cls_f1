# remove "-d" and add "-it" and "bash" at the end
# run this command with a path of your source code root path on your host as parameter like: create_run_container_ub22.04_Py3.8.5.sh

docker run --gpus all --runtime=nvidia -it -e DISPLAY=$DISPLAY --name ub22.04_cuda11.8_Py3.8.5_p8838 -v /tmp/.X11-unix:/tmp/.X11-unix -v $1:$1 -p 8838:8838 ub22.04_cuda11.8_Py3.8.5 bash

