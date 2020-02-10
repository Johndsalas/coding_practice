# Write a function that takes an array of numbers (integers for the tests) and a target number. 
# It should find two different items in the array that, when added together, give the target value. 
# The indices of these items should then be returned in a tuple like so: (index1, index2).

# For the purposes of this kata, some tests may have multiple answers; any valid solutions will be accepted.

# The input will always be valid (numbers will be an array of length 2 or greater, and all of the items will be numbers; 
# target will always be the sum of two different items from that array).

def two_sum(numbers, target):
    '''
    Function to find two numbers in an array, that are located at differint indexes 
    and add together to find a target value.
    '''
    # compare each number index to each number index 
    for i in range(0,len(numbers)):
        a = numbers[i]
        for i2 in range(0,len(numbers)):
            b = numbers[i2]

            # if index numbers are differint and number values add to the target value return index values
            if ((i != i2) and (a+b==target)):
                return (i,i2)
        
        
two_sum([1,2,3], 4)

two_sum([1234,5678,9012], 14690)

two_sum([2,2,3], 4)