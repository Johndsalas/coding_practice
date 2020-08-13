
import random as r

def engage_a_tron():
    '''
    Selects random student to call on in class
    '''

    roster = [  "Austin Aranda", "Christopher Ortiz", "Anthony Straine", "Adam Gomez", "Bibek Mainli", 
                "Bibek Mainli", "Bethany Thompson", "Corey Solitaire", "Gabby Broussard", "Samuel Davila",
                "Kwame Taylor", "Matthew Mays", "Daniella Bojado", "Gilbert Noriega", "Brandon Martinez",
                "Luke Becker", "Yongliang Shi", "Matt Knight", "George Arredondo", "Angel Gomez",
                "Cristian Moza"  ]

    return r.choice(roster)

engage_a_tron()