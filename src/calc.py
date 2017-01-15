from ctypes import cdll
lib = cdll.LoadLibrary('libcalc.so')

class Calc(object):
    def add_int(self, first, second):
        return lib.add_int(first, second)

first = 1
second = 2

calculator = Calc()
print(str(first) + " + " + str(second) + " = ")
print(calculator.add_int(1, 2))
