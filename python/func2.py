def list_sum(list):
    return sum(list)
list = [ 1, 1, 2, 3, 4, 5 ]
# write a funtion that tests if a list of strings contains the same string twich

def test_list(list):
    for i in range(len(list)):
        for j in range(i+1, len(list)):
            if list[i] == list[j]:
                return True
    return False

# test the function
list = [ 'a', 'b', 'c', 'd', 'e', 'f' ]
print(test_list(list))
