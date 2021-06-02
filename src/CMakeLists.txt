cmake_minimum_required(VERSION 3.0)
project ( lockmanager )

add_executable(server server.cpp)
target_link_libraries(server ${Boost_LIBRARIES})
target_link_libraries(server ${CMAKE_THREAD_LIBS_INIT})

