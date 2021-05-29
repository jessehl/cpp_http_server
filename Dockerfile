
# base image
FROM ubuntu:latest

# install cmake, gcc, g++, boost, and git
RUN apt-get update
RUN apt-get install -yq cmake gcc g++ 
RUN apt-get install -yq libboost-all-dev
RUN apt-get install -yq git

# Download netlib via git. Submodules are required because of its deps. 
RUN git clone --recurse-submodules --depth 1 --branch 0.13-release https://github.com/cpp-netlib/cpp-netlib.git

# build using cmake: https://cpp-netlib.org/0.13.0/getting_started.html#building-with-cmake
RUN mkdir cpp-netlib/cpp-netlib-build && cd cpp-netlib/cpp-netlib-build
RUN cmake -DBOOST_ROOT=/usr/include/boost \
../cpp-netlib
run make 
run make install
RUN cd ../..


# copy source files to the image
COPY server.cpp server.cpp
COPY CMakeLists.txt CMakeLists.txt

# build and run our own source code
RUN mkdir build && cd build
RUN cmake ..
RUN make 

EXPOSE 8000

CMD ["./server"]




