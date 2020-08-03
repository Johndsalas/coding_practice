'''
Functions practace
'''
number_list = [1, 2, 3]

def cumulative_sum(number_list):
    '''
    return list of cumulative sum of input list
    '''

    # set sum to zero 
    sum = 0

    # create empty list to hold sum totals
    sum_list = []

    # for each number in the input list
    for number in number_list:

        # add that number to sum
        sum += number

        # append sum to sum list
        sum_list.append(sum)

    # return list of sums
    return sum_list

cumulative_sum(number_list)
