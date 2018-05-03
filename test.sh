#!/bin/bash

for d in modules/*/ ; do
	mkdir ${d}build;
	cd ${d}build;
	cmake ..;
	ctest -V;
done
