include (CTest)

set (BUILD_TEST build_test)
set (UNIT_TEST ${UNIT_TEST_FILE})
set (MEMCHECK memcheck)
set (COMPLEXITY_TEST complexity_test)

if (TESTING_ENABLED)
enable_testing ()

if (BUILD_TEST_ENABLED)
add_test (
	NAME ${BUILD_TEST}
	COMMAND ${CMAKE_COMMAND} --build .
)
endif (BUILD_TEST_ENABLED)

if (UNIT_TEST_ENABLED)
add_executable (${UNIT_TEST} ${UNIT_TEST_FILE})

add_test (
	NAME ${UNIT_TEST}
	COMMAND ./${UNIT_TEST}
)

set_tests_properties (
	${UNIT_TEST} PROPERTIES
	DEPENDS ${BUILD_TEST}
)
endif (UNIT_TEST_ENABLED)

if (COMPLEXITY_TEST_ENABLED)
add_test (
	NAME ${COMPLEXITY_TEST}
	COMMAND lizard -C ${DANGEROUS_CYCLOMATIC_COMPLEXITY} --warnings_only .
	WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
)
endif (COMPLEXITY_TEST_ENABLED)

if (UNIX AND MEMCHECK_ENABLED)
add_test (
	NAME ${MEMCHECK}
	COMMAND valgrind --leak-check=full --error-exitcode=1 --errors-for-leak-kinds=definite,possible ./${UNIT_TEST}
)

set_tests_properties (
	${MEMCHECK} PROPERTIES
	DEPENDS ${BUILD_TEST}
)
endif (UNIX AND MEMCHECK_ENABLED)
endif (TESTING_ENABLED)
