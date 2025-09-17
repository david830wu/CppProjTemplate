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

add_executable(demo)
target_sources(
    demo
PUBLIC
    main.cpp
)
target_include_directories(
    demo
PRIVATE
    $<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/include>
    $<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/apps/demo>
    $<INSTALL_INTERFACE:include>
)
target_link_libraries(
    demo
PRIVATE
    {{ProjectName}}::{{ProjectName}}
    fmt::fmt
    Boost::boost
    Threads::Threads
)
install(TARGETS demo DESTINATION bin)
