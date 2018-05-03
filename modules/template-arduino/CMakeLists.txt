cmake_minimum_required (VERSION 2.8.11)
set(toolchain ../../toolchain) # Your path to kvasir_toolchain
set(CMAKE_TOOLCHAIN_FILE ${toolchain}/compilers/arm-none-eabi.cmake)
project(template-arduino CXX)

include(../../flags.cmake)

# Main file for the unit tests binary
set (UNIT_TEST_MAIN test/test_main.cpp)

# Highest cyclomatic complexity to allow without warning
set (DANGEROUS_CYCLOMATIC_COMPLEXITY 10)

set (TESTING_ENABLED true)
set (BUILD_TEST_ENABLED true)
set (UNIT_TEST_ENABLED true)
set (MEMCHECK_ENABLED true) # Linux only
set (COMPLEXITY_TEST_ENABLED true)

set(cxxflags
    "-Os"
    "-ffunction-sections"
    "-fdata-sections"
    "-fno-exceptions"
    "-fno-rtti"
    "-fno-threadsafe-statics")

string(REGEX REPLACE ";" " " cxxflags "${cxxflags}")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${cxxflags}")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -nostartfiles -nostdlib -Wl,--defsym=STACK_SIZE=92160")

link_libraries(gcc)

set(hwlib ../../libraries/hwlib)
include_directories(${hwlib}/library)
add_definitions(-DBMPTK_TARGET_arduino_due
                -DBMPTK_TARGET=arduino_due
                -DBMPTK_BAUDRATE=19200)

set(sources
    src/wrap-hwlib.cpp
    src/libc-stub.cpp
    src/main.cpp
)

# The target chip that is compiled for:
include(${toolchain}/targets/arm32/cm3/atmel/sam3x/sam3x8e/sam3x8e.cmake)

# The flashscript used to flash the binary (optional):
include(${toolchain}/targets/arm32/cm3/atmel/sam3x/sam3x8e/flashscripts/arduino_due.cmake)

## Includes the R2D2 Testing Suite
include (TestingModule.cmake)
