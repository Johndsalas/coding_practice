# 6) Define a function named handle_commas. It should accept a string that is a number that contains commas in it as input,
#  and return a number as output

def handle_commas(number):
    '''
    My function for handling commas exersize
    '''

    number = int(number.replace(',', ''))
    
    return number
    

def handle_commas(num):
    '''
    Validating student function for handling commas exersize
    '''

    assert type(num) == str, "Invalid Input"
    num_list = list(num)
    for number in num_list:
        if number == ",":
            num_list.remove(number)
    new_list = ''.join(num_list)
    new_list = int(new_list)
    return new_list
