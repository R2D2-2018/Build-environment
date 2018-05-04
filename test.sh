#!/bin/bash

for d in modules/*/ ; do
	mkdir ${d}build_test;
	cd ${d}build_test;
	cmake .. -Dtest_build=TRUE;
	ctest -V;
done
