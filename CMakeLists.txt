cmake_minimum_required(VERSION 3.30)
project(yap C CXX)

set(CMAKE_C_STANDARD 11)

include_directories(src)

add_executable(yap
    src/yap.c
)

# GoogleTest requires at least C++14
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

include(FetchContent)
FetchContent_Declare(
        googletest
        URL https://github.com/google/googletest/archive/03597a01ee50ed33e9dfd640b249b4be3799d395.zip
)
set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
FetchContent_MakeAvailable(googletest)

enable_testing()

add_executable(yap_test
        tests/hello_test.cpp
)

target_link_libraries(
        yap_test
        GTest::gtest_main
)

include(GoogleTest)
gtest_discover_tests(yap_test)

