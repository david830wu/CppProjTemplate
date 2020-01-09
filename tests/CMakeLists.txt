cmake_minimum_required(VERSION 3.12)

project({{ProjectName}}Test
        VERSION {{Version}}
        DESCRIPTION "{{ProjectName}} test cases"
        LANGUAGES C CXX
)

if(POLICY CMP0076)
  cmake_policy(SET CMP0076 NEW)
endif()

enable_testing()

# enable c++17 globally
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

find_package(Catch2 REQUIRED)

# list and compile executable
list(APPEND target_tests "{{ProjectName}}Test")

if ("{{ProjectName}}Test" IN_LIST target_tests)
    add_executable({{ProjectName}}Test)
    target_sources({{ProjectName}}Test PUBLIC {{ProjectName}}Test.cpp)
    target_link_libraries({{ProjectName}}Test PUBLIC Catch2::Catch2 {{ProjectName}}::{{ProjectName}})
    add_test("{{ProjectName}}Test" {{ProjectName}}Test)
endif()
