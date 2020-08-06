'''
Does an imported function have access to to global variables?
looks like no...
'''
# tried
# from test_function import number_plus_ten_imported

import test_function as tf

NUMBER = 10

def number_plus_ten(): # use global variable in module, works

    global NUMBER 
    
    NUMBER += 10
    
number_plus_ten()

print(NUMBER)

tf.number_plus_ten_imported() # import the same module renamed, gets error

print(NUMBER)