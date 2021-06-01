# base image
FROM ubuntu:latest

# install cmake, gcc, g++, boost, and git
RUN apt-get update
RUN apt-get install -yq cmake gcc g++ 
RUN apt-get install -yq libboost-all-dev
RUN apt-get install -yq git

# Download netlib via git. Submodules are required because of its deps. 
RUN git clone --recurse-submodules --depth 1 --branch 0.13-release https://github.com/cpp-netlib/cpp-netlib.git

# Install netlib using cmake.
# See: https://cpp-netlib.org/0.13.0/getting_started.html#building-with-cmake
# cmake will be installed in /usr/local.
RUN mkdir cpp-netlib/cpp-netlib-build && cd cpp-netlib/cpp-netlib-build
RUN cmake -DBOOST_ROOT=/usr/include/boost \
-DCMAKE_CXX_FLAGS=-std=c++11 \
../cpp-netlib
RUN make 
RUN make install


# copy source files to the image
WORKDIR /
COPY server.cpp docker_netlib/server.cpp
COPY CMakeLists.txt docker_netlib/CMakeLists.txt

# build the executable
RUN mkdir docker_netlib/build 
WORKDIR docker_netlib/build
RUN cmake -DCMAKE_CXX_FLAGS=-std=c++11 .. 
RUN make 

# run the app!
ENTRYPOINT ["./server"]
CMD ["0.0.0.0", "8000"]




