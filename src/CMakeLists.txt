cmake_minimum_required(VERSION 3.27)

project({{ProjectName}}Lib
        VERSION {{Version}}
        DESCRIPTION "{{ProjectName}}"
        LANGUAGES C CXX
)

if(POLICY CMP0076)
  cmake_policy(SET CMP0076 NEW)
endif()

# enable c++20 globally
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

add_library({{ProjectName}})
target_sources(
    {{ProjectName}}
PRIVATE
    {{ProjectName}}.cpp
)
target_include_directories(
    {{ProjectName}}
PUBLIC
    $<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/include>
    $<INSTALL_INTERFACE:include>
)
set_target_properties(
    {{ProjectName}} 
PROPERTIES PUBLIC_HEADER 
    "{{ProjectName}}.h;{{ProjectName}}Version.h"
)
target_link_libraries(
    {{ProjectName}}
PUBLIC
    Boost::boost
    fmt::fmt
    Threads::Threads
)
add_library({{ProjectName}}::{{ProjectName}} ALIAS {{ProjectName}})

install(TARGETS {{ProjectName}} 
    DESTINATION lib
    PUBLIC_HEADER DESTINATION include
)

install(TARGETS {{ProjectName}}
    EXPORT {{ProjectName}}Targets
    LIBRARY DESTINATION lib
    INCLUDES DESTINATION include
)

set(ConfigPackageLocation lib/cmake/{{ProjectName}})
install(EXPORT {{ProjectName}}Targets
    FILE {{ProjectName}}Targets.cmake
    NAMESPACE {{ProjectName}}::
    DESTINATION ${ConfigPackageLocation}
)
install(FILES ${CMAKE_SOURCE_DIR}/cmake/{{ProjectName}}Config.cmake
    DESTINATION ${ConfigPackageLocation}
)
