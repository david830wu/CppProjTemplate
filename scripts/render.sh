#!/bin/sh

# set project init variables
ProjectName="ProjectName"
Description="Description of project"
Author="Author"
Today=$(date '+%Y%m%d')
Version="0.1"

# render template files
echo "Rendering file templates"
find . -type f -exec \
    sed -i "s,{{ProjectName}},${ProjectName},g; \
            s,{{Description}},${Description},g; \
            s,{{Author}},${Author},g; \
            s,{{Today}},${Today},g; \
            s,{{Version}},${Version},g; \
    " {} \;

# rename files
echo "Rendering file names"
mv "include/ProjectName.h" "include/${ProjectName}.h"
mv "src/ProjectName.cpp" "src/${ProjectName}.cpp"
mv "tests/ProjectNameTest.cpp" "tests/${ProjectName}Test.cpp"
mv "cmake/ProjectNameConfig.cmake" "cmake/${ProjectName}Config.cmake"

echo "All Done"
