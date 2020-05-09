
args = [-6,-3,-2,-1,0,1,3,4,5,7,8,9,10,11,14,15,17,18,19,20]
# '-6,-3-1,3-5,7-11,14,15,17-20'
#Test.assert_equals(solution([-3,-2,-1,2,10,15,16,18,19,20]), '-3--1,2,10,15,16,18-20')


def solution(args):
    
    beginning = 'nan'
    ending = 'nan'

    line = ''

    for number in args:

        beginning = number

        check = args.index(number) + 1

        while number + 1 == args[check]:

            try:
                args.remove(check)
                print(f'removing {number}')
                number += 1
                ending = number

            except:
                
                break

    return args
             
    #     else:
            
    #         line += str(beginning) + ','
        

    # return line[:-1]


solution(args)