t1 = (1, 2, 3)

def sum_all(*nums):
    """
    This function takes a tuple of numbers and returns the sum of all the numbers in the tuple.
    """
    total = 0
    for i in nums:
        total += i
    return total


def describe_person(name, height, age, phone=None, address=None, like=True):
    if like:
        description = (
            f"{name} is a nice person, beautifully built, "
            f"about {height} tall and {age} years old."
        )
    else:
        description = (
            f"{name} is ugly, short, and {age} years old. Not pleasant to be around."
        )

    # Optionally add phone and address if provided
    if phone:
        description += f" Phone: {phone}."
    if address:
        description += f" Address: {address}."

    return description

print(describe_person("Alice", "5'7", 28, like=True))
print(describe_person("Bob", "5'3", 35, phone="123-456", like=False))