cmake_minimum_required (VERSION 2.8.11)
project (HELLO)

set(UNIT_TEST unit_test)

add_executable (hello main.cpp)
add_executable (${UNIT_TEST} EXCLUDE_FROM_ALL ${UNIT_TEST}.cpp)

enable_testing ()

add_test (
	NAME ${UNIT_TEST}
	COMMAND ./${UNIT_TEST}
)

add_custom_command(
     TARGET ${UNIT_TEST}
     COMMENT "Run tests"
     POST_BUILD 
     WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
     COMMAND ${CMAKE_CTEST_COMMAND} -C $<CONFIGURATION> -R "^${UNIT_TEST}$"
)
