[![Build Status](https://travis-ci.org/JulianvDoorn/r2d2-continuous-integration-template.svg?branch=master)](https://travis-ci.org/JulianvDoorn/r2d2-continuous-integration-template)

# R2D2 Development Template Repository

## Usage:

#### Merging the suite with an existing repository:

```bash
git remote add r2d2-ci-suite git@github.com:JulianvDoorn/r2d2-continuous-integration-template.git
git pull r2d2-ci-suite master
```
> Once the commits have been pulled, there may be conflicts. It is advised to prioritize the Testing Suite over the recieving repository in order to secure integrity and functionality.

Windows:
```batch
configure.bat
```

Linux:
```bash
chmod +x configure.sh
./configure.sh
```

#### Fresh setup:
Windows:
```batch
git clone git@github.com:JulianvDoorn/r2d2-continuous-integration-template.git
cd r2d2-continuous-integration-template
configure.bat
```

Linux:
```bash
git clone git@github.com:JulianvDoorn/r2d2-continuous-integration-template.git
cd r2d2-continuous-integration-template
chmod +x configure.sh
./configure.sh
```

Running these commands will add a `build/` folder and generates build ready files.

#### Building:
> Assumed that the commands are launched from the root directiory of the repository
TODO

# Dependencies

Essential:
- G++ 5.4.0
- CMake version 3.5.1

Non-essential:
- Valgrind-3.11.0
Used for detecting memory leaks, Linux only.
- Python 2.7.12
Used by Lizard.
- Lizard version 1.14.10
Used for calculating code complexity metrics.

Linux package install commands:
```bash
sudo apt install g++
sudo apt install cmake
sudo apt install valgrind
sudo apt install python2.7
sudo pip2 install lizard
```

> Non-essential dependencies are normally only run during testing. Tests are run by the continuous integration, but it could be helpful to be able to run them offline.

> Actual dependency version numbers may vary as long as the CLI interface and behavior match
