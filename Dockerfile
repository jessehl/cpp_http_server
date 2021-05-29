
# base image containing boost
FROM ubuntu:latest


# copy all files to the image
COPY cpp-netlib cpp-netlib
COPY server.cpp server.cpp

# install cmake
RUN apt-get update
RUN apt-get install -yq cmake libboost-all-dev libssl-dev gcc 
#RUN which cmake
#RUN apt-get install build-essential -y && \
#wget http://www.cmake.org/files/v3.2/cmake-3.2.2.tar.gz && \
#tar xf cmake-3.2.2.tar.gz && \
#cd cmake-3.2.2 && \
#./configure && \
 #make

# build using cmake: https://cpp-netlib.org/0.13.0/getting_started.html#building-with-cmake
RUN cmake -DCMAKE_BUILD_TYPE=Debug \
-DCMAKE_C_COMPILER=gcc \
-DCMAKE_CXX_COMPILER=g++ \
-DBOOST_ROOT=/usr/include/boost \
cpp-netlib
RUN make

CMD ["bash"]



