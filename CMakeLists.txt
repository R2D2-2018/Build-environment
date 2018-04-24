cmake_minimum_required (VERSION 2.8.11)
project (HELLO)

# Main file for the unit tests binary
set (UNIT_TEST_FILE unit_test.cpp)

# Highest cyclomatic complexity to allow without warning
set (DANGEROUS_CYCLOMATIC_COMPLEXITY 10)

set (TESTING_ENABLED true)
set (BUILD_TEST_ENABLED true)
set (UNIT_TEST_ENABLED true)
set (MEMCHECK_ENABLED true) # Linux only
set (COMPLEXITY_TEST_ENABLED true)

## Includes the R2D2 Testing Suite
include (TestingModule.cmake)

add_executable(main main.cpp)
