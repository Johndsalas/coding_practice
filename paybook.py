'''
Checkbook project proof of concept

The following code is provided to students (possibly scrambled)
groups of students will then be assigned to work on each functon
students then combine their collective efforts to form a complete checkbook
Checkbook should look something like the code in this file they can be encouraged to 
make improvements if they are finishing early

note: example code runs, but does not screen for bad input.

goals:
increased understanding of functions and process flow
indroduce imports
introduce writing to files
dramatically reduce time needed for check_book project

code given to students:

impot json

def set_initial_value():

def menu():

def make_deposit():

def make_withdraw():

def additional_transaction():

def view_balance():

def check_book():

    running = True

    while running:

        option = menu()  # give menue and get user choice for view withdraw or deposit

        if option == '1':

            view_balance() # view balance in account

        elif option == '2':

            make_withdraw() # make withdraw and display amount remaining in account

        elif option == '3':

            make_deposit() # make deposit and display amount remaining in account

        else:

            break

        if not additional_transaction():  # prompt user for additional transaction
            break

'''

import json

def set_initial_value():

    starting_value = 30000

    with open('checkbook.json', 'w') as json_file:
    
        json.dump(starting_value, json_file)


def menu():

    print("Thank you for using checkbook.")
    print("What would you like to do?")
    print()
    print("1) View balance")
    print("2) Make a withdraw")
    print("3) Make a deposit")
    print("4) Close program")
    print("")

    choice = input()
    
    return choice

def make_deposit():

    print("How much would you like to deposit?")

    deposit = input()

    with open('checkbook.json') as f:
        
        total = int(json.load(f))

    total += int(deposit)

    print(f"You have deposited ${deposit}")
    print(f"total in account is ${total}")

    with open('checkbook.json', 'w') as json_file:
    
        json.dump(total, json_file)


def make_withdraw():

    print("How much would you like to withdraw?")

    withdraw = input()

    with open('checkbook.json') as f:
        
        total = int(json.load(f))

    total -= int(withdraw)

    print(f"You have withdrawn ${withdraw}")
    print(f"total in account is ${total}")

    with open('checkbook.json', 'w') as json_file:
    
        json.dump(total, json_file)


def additional_transaction():

    print("")
    print("Wold you like to make another transaction? (y/n)")
    decision = input()

    if decision == 'y':

        return True

    else:

        return False

def view_balance():

    with open('checkbook.json') as f:
        
        total = int(json.load(f))

    print(f"total in account is ${total}")

def check_book():

    running = True

    while running:

        option = menu()  # give menue and get user choice for view withdraw or deposit

        if option == '1':

            view_balance() # view balance in account

        elif option == '2':

            make_withdraw() # make withdraw and display amount remaining in account

        elif option == '3':

            make_deposit() # make deposit and display amount remaining in account

        else:

            break

        if not additional_transaction():  # prompt user for additional transaction
            break

check_book()