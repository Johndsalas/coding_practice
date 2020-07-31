''' Login Program  '''

def verify(username, password):
    '''
    Verify Name and password
    '''
    # get length of password
    pass_len = len(password)

    # set booleans
    five_or_more = (pass_len >= 5)

    twenty_or_less = (pass_len <= 20)

    different = (password != username)

    user_no_white_space = ((username[0] != " ") and (username[-1] != " "))

    pass_no_white_space = ((password[0] != " ") and (password[-1] != " "))

    no_white_space = (user_no_white_space and pass_no_white_space)

    # display error message
    if not five_or_more:

        print("Name too short")
        print("")

    if not twenty_or_less:

        print("Name too Long")
        print("")

    if not different:

        print("Username/Password cannot be the same")
        print("")

    if not no_white_space:

        print("Username/Password cannot begin or end with a space")
        print("")

    # return True if username and password are acceptable False if they are not

    if (five_or_more and twenty_or_less and different and no_white_space):
        return True

    else:
        return False


def login():
    '''
    Get Login Data
    '''

    # propt user for input and store variables
    print("Enter Username:")
    username = input()
    print("Enter Password:")
    print("")
    password = input()

    # if verify true print success message
    if verify(username, password):

        print("You have successfully created your Login!")
        print(f"Username: {username[0:3]}****")
        print(f"Password: {password[0]}****")

    #if verify false recall login function
    else:
        login()

login()
