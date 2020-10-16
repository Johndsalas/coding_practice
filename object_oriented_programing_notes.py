
# define class Dog
class Dog:

    # initialize class create variable name
    def __init__(self, name):
        self.name = name
      

    def get_name(self):
        return self.name


d = Dog("tim")
print(d.get_name())
d2 = Dog("Bill")
print(d2.get_name)