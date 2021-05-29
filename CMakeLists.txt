project(server)
set ( CMAKE_PREFIX_PATH ${CMAKE_PREFIX_PATH} cpp-netlib/cpp-netlib-build )

find_package ( cppnetlib 0.13.0 REQUIRED )
include_directories ( ${CPPNETLIB_INCLUDE_DIRS} )
target_link_libraries (server ${CPPNETLIB_LIBRARIES} )

add_executable(server server.cpp)