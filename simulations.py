
import random as r

# odds of rollong doubbles on two 6 sided dice
numerator = 0 
number_of_trials = 100000
denominator = number_of_trials

for number in range(1,number_of_trials+1):

    die1 = r.randint(1,6)

    die2 = r.randint(1,6)

    if die1 == die2:

        numerator += 1

odds = numerator / denominator

print(odds)

1/6

# If you flip 8 coins, 
# what is the probability of getting exactly 3 heads?
numerator = 0
number_of_trials = 100000
denominator = number_of_trials

def get_three_heads():

    coins = 8
    desired_number_of_heads = 3
    number_of_heads = 0

    for c in range(1,coins+1):

        coin = r.randint(1,2)

        if coin == 1:

            number_of_heads += 1

    if desired_number_of_heads == number_of_heads:

        return True

    else:

        return False


for trial in range(1,number_of_trials+1):

    if get_three_heads():

        numerator += 1

odds = numerator / denominator

print(odds)

# What is the probability of getting more than 3 heads?

numerator = 0
number_of_trials = 100000
denominator = number_of_trials

def get_three_heads_or_more():

    coins = 8
    desired_number_of_heads = 3
    number_of_heads = 0

    for c in range(1,coins+1):

        coin = r.randint(1,2)

        if coin == 1:

            number_of_heads += 1

    if desired_number_of_heads >= number_of_heads:

        return True

    else:

        return False


for trial in range(1,number_of_trials+1):

    if get_three_heads():

        numerator += 1

odds = numerator / denominator

print(odds)

#There are approximitely 3 web development cohorts for every 1 data science cohort at Codeup. 
# Assuming that Codeup randomly selects an alumni to put on a billboard, 
# what are the odds that the two billboards I drive past both have data science students on them?
import random as r
numerator = 0
number_of_trials = 100000
denominator = number_of_trials

def get_trial():

    total = 2
    desired_number = 2
    number = 0

    for t in range(1,total+1):

        rng = r.randint(1,4)

        if rng == 1:

            number += 1

    if desired_number == number:

        return True

    else:

        return False

for trial in range(1,number_of_trials+1):

    if get_trial():

        numerator += 1

odds = numerator / denominator

print(odds)

.25**2

# Codeup students buy, on average, 3 poptart packages (+- 1.5) a day from the snack vending machine. 
# If on monday the machine is restocked with 17 poptart packages, 
# how likely is it that I will be able to buy some poptarts on Friday afternoon?

import random as r
numerator = 0
number_of_trials = 100000
denominator = number_of_trials

def get_trial():

    total = 2
    desired_number = 2
    number = 0

    for t in range(1,total+1):

        rng = r.randint(1,4)

        if rng == 1:

            number += 1

    if desired_number == number:

        return True

    else:

        return False

for trial in range(1,number_of_trials+1):

    if get_trial():

        numerator += 1

odds = numerator / denominator

print(odds)