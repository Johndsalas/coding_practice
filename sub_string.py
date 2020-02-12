
def in_array(array1, array2):
    '''
    compare two arrays of strings and return a list of all strings in array1 that are a substring of one 
    or more strings in array2. Returned list is in lexicographical order
    '''

    lst = []

    # loop through each string in array2
    for word in array2:

        # append string in array1 to list if it is a substring of a word in array2
        [lst.append(string) for string in array1 if string in word]
  
    # remove duplicates by changing to a set and back to a list then sort list using sorted()
    return sorted(list(set(lst)))

get_substring(["w","n","so"],["what","now","son"])