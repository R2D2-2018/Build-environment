#!/bin/bash

for d in modules/*/ ; do
	cd mkdir ${d}build;
	cd ${d}build;
	cmake ..;
	ctest -V;
done
