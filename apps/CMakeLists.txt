cmake_minimum_required(VERSION 3.27)

project({{ProjectName}}Apps
        VERSION {{Version}}
        DESCRIPTION "{{ProjectName}} apps"
        LANGUAGES C CXX
)

if(POLICY CMP0076)
  cmake_policy(SET CMP0076 NEW)
endif()

# enable c++20 globally
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# list and compile executable
list(APPEND target_apps "demo")

if ("demo" IN_LIST target_apps)
    add_subdirectory(demo)
endif()
