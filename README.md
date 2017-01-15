
# Compile

Compile the C++ as a shared library:

    g++ -c -fPIC src/calc.cpp -o src/calc.o
    g++ -shared -Wl,-soname,libcalc.so -o src/libcalc.so src/calc.o

