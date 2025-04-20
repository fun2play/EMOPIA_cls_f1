# add --progress=plain below if debug/trouble shooting is needed
docker build --progress=plain --no-cache -t ub22.04_cuda11.8_Py3.8.5 -f Dockerfile_ub22.04_cuda11.8_Py3.8.5 .
