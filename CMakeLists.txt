cmake_minimum_required(VERSION 3.30)
project(yap C)

set(CMAKE_C_STANDARD 11)

include_directories(src)

add_executable(yap
    src/yap.c
)
