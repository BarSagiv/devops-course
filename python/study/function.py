
def get_info():
    # this following code returns a dictionary with names and hobbies
    names = [ 'Alice', 'Bob', 'Charlie', 'David', 'Eve' ]
    hobbies = [ 'Reading', 'Hiking', 'Cooking', 'Gaming', 'Painting' ]
    info_data = { 'names' : names, 'hobbies' : hobbies }
    return info_data

def print_data(names, hobbies):
    # this following code display the names and hobbies
    if len(names) != len(hobbies):
        pass # do something here

    for name_id in range(len(names)):
        print(f"{names[name_id]}: {hobbies[name_id]}")
    