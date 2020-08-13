

def normalize_name(any_string):
    newstr = any_string.lower()
  
    newstr = newstr.replace(space, "_")
  
    newstr = newstr.replace(string, "")
    
    return newstr
normalize_name("%% today is !!")
