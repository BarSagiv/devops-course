while not input('enter your username: '):
    pass
print('Username is set.')




while True:
    data = input('Enter a username: ')
    if data:
        print(data)
        break



data = ''
while not data:
    data = input('Enter a username: ')
    print('good!')
print('Username is set.')