
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

    days = 5
    beginning_total = 17
    average= 3
    sd = 2
    desired_remaining_poptarts = 1
    buy_total = 0

    for t in range(1,days+1):

        buy = r.randint(average-sd,average+sd)

        buy_total += buy

    if beginning_total > buy_total:

        return True

    else:

        return False

for trial in range(1,number_of_trials+1):

    if get_trial():

        numerator += 1

odds = numerator / denominator

print(odds)

# Compare Heights
# Men have an average height of 178 cm and standard deviation of 8cm.
# Women have a mean of 170, sd = 6cm.
# If a man and woman are chosen at random, P(woman taller than man)?

import random as r
numerator = 0
number_of_trials = 100000
denominator = number_of_trials

def get_trial():

    male_ave = 178
    male_sd = 16

    female_ave = 170
    female_sd = 12

    male_hight = r.randint(male_ave - male_sd, male_ave + male_sd)
    female_hight = r.randint(female_ave - female_sd, female_ave + female_sd)


    if female_hight > male_hight:
        
        return True

    else:

        return False

for trial in range(1,number_of_trials+1):

    if get_trial():

        numerator += 1

odds = numerator / denominator

print(odds)

# When installing anaconda on a student's computer, there's a 1 in 250 chance that the download is corrupted and the installation fails. 
# What are the odds that after having 50 students download anaconda, no one has an installation issue? 
# 100 students?
# What is the probability that we observe an installation issue within the first 150 students that download anaconda?
# How likely is it that 450 students all download anaconda without an issue?


import random as r
numerator = 0
number_of_trials = 100000
denominator = number_of_trials

def get_trial():

    students = 50 #100 150 450

    for student in range(1,students+1):

        error = r.randint(1,250)

        if error == 1:
        
            return False

    return True

for trial in range(1,number_of_trials+1):

    if get_trial():

        numerator += 1

odds = numerator / denominator # odds of no failure, subtract from one to get odds of failure

print(odds)

# There's a 70% chance on any given day that there will be at least one food truck at Travis Park. 
# However, you haven't seen a food truck there in 3 days. How unlikely is this?
# How likely is it that a food truck will show up sometime this week?

import random as r
numerator = 0
number_of_trials = 100000
denominator = number_of_trials

def get_trial():

    days = 3 # change number for differint number of days

    for day in range(1,days+1):

        truck = r.randint(1,10)

        if truck > 3:

            return False

    return True

for trial in range(1,number_of_trials+1):

    if get_trial():

        numerator += 1

odds = numerator / denominator # odds of no truck, subtract from one to get odds of truck

print(odds)

.3**3

# If 23 people are in the same room, what are the odds that two of them share a birthday? 
# What if it's 20 people? 40?


import random as r
numerator = 0
number_of_trials = 100000
denominator = number_of_trials

def get_trial():

    people = 40
    bday_list = []

    for person in range(1,people+1):

        bday = r.randint(1,365)

        if bday in bday_list:

            return True

        else:

            bday_list.append(bday)

    return False

for trial in range(1,number_of_trials+1):

    if get_trial():

        numerator += 1

odds = numerator / denominator # odds of no truck, subtract from one to get odds of truck

print(odds)

