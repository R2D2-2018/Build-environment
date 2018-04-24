#include <iostream>
#include <string>

void memoryLeakFunction() {
	std::string* str = new std::string("stuff");
}

int main() {
	std::cout << "Test successful!" << std::endl;
	std::cout << "Second line!" << std::endl;

	memoryLeakFunction();

	return 0;
}
