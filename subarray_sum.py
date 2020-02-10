# The maximum sum subarray problem consists in finding the maximum sum of a contiguous subsequence in an array or list of integers:

# maxSequence([-2, 1, -3, 4, -1, 2, 1, -5, 4])
# # should be 6: [4, -1, 2, 1]
# Easy case is when the list is made up of only positive numbers and the maximum sum is the sum of the whole array.
# If the list is made up of only negative numbers, return 0 instead.

# Empty list is considered to have zero greatest sum. Note that the empty list or array is also a valid sublist/subarray.

def max_sequence(arr):
    '''
    Function for finding the sub-array with the gratest sum
    '''

    # return 0 if array is empty
    if len(arr) == 0:
        return 0
    
    # count number of negative numbers
    count = 0
    for number in arr:
        if number < 0:
            count += 1
    
    # return 0 if all numbers are negative
    if count == len(arr):
        return 0

    
    sublist = []
   
    # itterate through all numbers in array
    for number in range(0,len(arr)):

        s = number
        f = len(arr)
        
        # get beginning itterations
        while f != s:
    
            sublist.append(sum(arr[s:f]))
            f -= 1

        s = number
        f = len(arr)

        # get ending itterations
        while f != s:

            sublist.append(sum(arr[s:f]))
            s += 1

        s = number
        f = len(arr)
        c = 1

        # drop number at one end then the other
        while f != s:

            sublist.append(sum(arr[s:f]))

            if c % 2 > 0:
                s += 1
            else:
                f -= 1

        s = number
        f = len(arr)
        c = 1

        # drop in reverse order
        while f != s:

            sublist.append(sum(arr[s:f]))

            if c % 2 > 0:
                f -= 1
            else:
                s += 1
                
    return max(sublist)
