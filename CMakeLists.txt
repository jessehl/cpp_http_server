cmake_minimum_required ( VERSION 2.8.9 )

project ( server )

add_executable ( server server.cpp )

find_package ( cppnetlib 0.13.0 REQUIRED )
find_package ( Boost 1.65 COMPONENTS system thread REQUIRED )
include_directories ( ${CPPNETLIB_INCLUDE_DIRS} )
target_link_libraries ( server ${CPPNETLIB_LIBRARIES} )


