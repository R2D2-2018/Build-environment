#!/bin/bash

for d in modules/*/ ; do
	mkdir ${d}test_build;
	cd ${d}test_build;
	cmake ..;
	ctest -V;
done
