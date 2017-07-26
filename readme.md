# Matlab-Golang OSX Crash Demonstration

This is an example showing how using Golang with Matlab on OSX will crash the program.

## Instructions

First, build the project:

```
git clone https://github.com/kofalt/matlab-golang-crash && cd matlab-golang-crash

./make.sh
```

This will download a new, clean installation of Golang to the current directory and build the shared object file.

Next, load the object into Matlab:

```matlab

addpath('/path/to/matlab-golang-crash')

loadlibrary('simple', 'simple.h')

ptrValue = calllib('simple', 'SimpleExample')
```

The second line should produce the crash.

## Debug information

An example crash log is provided in the `example-crash.txt` file.

The output of the matlab `ver` command for our box is provided in the `example-ver.txt` file.
