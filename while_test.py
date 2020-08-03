'''
demonstrate the while loops wait until the end of the loop to check conditions 
'''

# loop breaks immediatly on break if number = 3, prints 1 and 2
number = 0

while True:

    number += 1

    if number == 3 :

        break

    print(number)


# loop changes on to false if number = 3, but dose not check for break conditions untill the end of the loop
# prints 1, 2 and 3 

number = 0

on = True

while on:

    number += 1

    if number == 3:

        on = False
        
    print(number)

