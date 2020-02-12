def triple_double(num1, num2):
    '''
    check two number sequences
    if the first sequence has the name number three times in a row and the second number has the same number twice in a row return 1
    otherwise return 0
    '''

    # convert numbers to strings
    num1 = str(num1)
    num2 = str(num2)
 
    count = 0

    double = False

    lst = []
  
    # compare digits in the first number string to one another
    for x in num1:
        for y in num1:
      
            # if the next number in the squence matches increase the count by one otherwise reset the count
            if x == y:
                count += 1
              
                # if the count reaches 3 append the compared number to a list
                if count == 3:
                    lst.append(x)
                    count = 0

            else:
                count = 0

    # remove duplicate numbers
    lst = list(set(lst))

    # if list is not empty
    if len(lst) > 0:

        count = 0
        
        # compare digits in list with digits in second number
        for l in lst:
            for n in num2:
      
                # if the next number in sequence matches increase the counter otherwise reset counter
                if l == n:
                    count += 1

                    # if counter reaches 2 set double to true
                    if count == 2:
                        double = True
                        count = 0
                else:
                    count = 0
    
    if double:
        return 1
    else:
        return 0

triple_double(451999277, 41177722899)