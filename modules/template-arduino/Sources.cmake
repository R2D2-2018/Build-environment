# Toolchain:

set (toolchain $ENV{R2D2_BUILD_ENVIRONMENT}/toolchain) # Your path to kvasir_toolchain

# Libraries:

link_libraries (gcc)

set (hwlib $ENV{R2D2_BUILD_ENVIRONMENT}/libraries/hwlib)
include_directories (${hwlib}/library)
add_definitions (-DBMPTK_TARGET_arduino_due
                 -DBMPTK_TARGET=arduino_due
                 -DBMPTK_BAUDRATE=19200)

set (catch $ENV{R2D2_BUILD_ENVIRONMENT}/libraries/Catch2)
include_directories (${catch}/single_include)

# Source Files:

set (sources
    src/wrap-hwlib.cpp
    src/libc-stub.cpp
    src/main.cpp
)
