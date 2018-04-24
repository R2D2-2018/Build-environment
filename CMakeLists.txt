cmake_minimum_required (VERSION 2.8.11)
project (HELLO)

include (CTest)

## Test names
set (BUILD_TEST build_test)
set (UNIT_TEST unit_test)
set (COMPLEXITY_TEST complexity_test)
set (MEMCHECK memcheck)



add_executable (hello main.cpp)
add_executable (${UNIT_TEST} ${UNIT_TEST}.cpp)

enable_testing ()

add_test (
	NAME ${BUILD_TEST}
	COMMAND ${CMAKE_COMMAND} --build .
)

add_test (
	NAME ${UNIT_TEST}
	COMMAND ./${UNIT_TEST}
)

add_test (
	NAME ${COMPLEXITY_TEST}
	COMMAND lizard -C 10 --warnings_only .
	WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
)

add_test (
	NAME ${MEMCHECK}
	COMMAND valgrind --leak-check=full --error-exitcode=1 --errors-for-leak-kinds=definite,possible ./${UNIT_TEST}
)

set_tests_properties (
	${UNIT_TEST} ${MEMCHECK} PROPERTIES
	DEPENDS ${BUILD_TEST}
)
