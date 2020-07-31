

def get_primes(number):

    # get list of numbers from 0 to number
    number_range = [number for number in range(2,number+1)]

    # list to hold prime numbers
    primes = []

    # itterate through numbers if number is prime add it to primes
    for num in number_range:

        # create checklist for all numbers less than num
        check_range = list(range(1,num))

        # remove 1 from checklist
        check_range.remove(1)

        # if number is prime add to primes
        if is_prime(num,check_range):

            primes.append(num)

    # return primes
    return primes


def is_prime(num,check_range):
    '''
    Checks to see if a number is prime
    '''

    # set is prime to true
    is_prime = True

    # itterate through numbers in num_check
    for check in check_range:

        # attempt to divide num by number in check if remander is 0 set is_prime to false
        if num % check == 0:

            is_prime = False

    # return boolean value for is_prime
    return is_prime

get_primes(20)


