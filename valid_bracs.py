# Write a function that takes a string of braces, and determines if the order of the braces is valid. It should return true if the string is valid, and false if it's invalid.

# This Kata is similar to the Valid Parentheses Kata, but introduces new characters: brackets [], and curly braces {}. Thanks to @arnedag for the idea!

# All input strings will be nonempty, and will only consist of parentheses, brackets and curly braces: ()[]{}.

# What is considered Valid?
# A string of braces is considered valid if all braces are matched with the correct brace.

def validBraces(string):
    '''
    Function to check for balanced brackets
    '''

    # create list to identify open and closed brackets
    open_list = ['(','[','{']
    close_list = [')',']','}']
  
    #create list to check with
    check_list = []

    # loop through symbles in list
    for symble in string:
      
        # if the symble is in the open list append it to the check list
        if symble in open_list:
            check_list.append(symble)

        # if the symble is in the close list note its position in the close list
        elif symble in close_list:
            position = close_list.index(symble)

            # if the check_list is populated and the open list position is the same as the close list positoin remove the symble from the check list
            if ((len(check_list) > 0) and (open_list[position] == check_list[len(check_list)-1])):
                check_list.remove(check_list[len(check_list)-1])

            # if no matching open bracket is found return false
            else:
                return False

    # if all symble matches are accounted for return true
    if len(check_list) == 0:
        return True

validBraces("()")
validBraces("[(])")