#Write an algorithm that takes an array and moves all of the zeros to the end, preserving the order of the other elements.

def move_zeros(array):

    w = []
    d = 0

    for i in array:

        if i is False:
            w.append(False)

        elif i == 0:
            d += 1

        else:
            w.append(i)

    for i in range(0,d):
        w.append(0)
        
    return w

move_zeros(["a",0,0,"b",None,"c","d",0,1,False,0,1,0,3,[],0,1,9,0,0,{},0,0,9])
move_zeros([0,1,None,2,False,1,0])
ove_zeros(["a","b"])
move_zeros(["a"])
move_zeros([0,0])
move_zeros([0])
move_zeros([False])
move_zeros([])

str(False)