# This is a funtion that tests if two lists of strings contains the same string twich, one is true and one is false.
def test_list(list):
    for i in range(len(list)):
        for j in range(i+1, len(list)):
            if list[i] == list[j]:
                return True
    return False

# Test the function
list = [ 'a', 'b', 'c', 'd', 'e', 'f' ]
print(test_list(list))

list2 = [ 'a', 'b', 'c', 'd', 'e', 'f', 'a' ]
print(test_list(list2))