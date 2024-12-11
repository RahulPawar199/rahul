number = 15

if number % 2 == 0:
    print(f"{number} is even.")
elif number % 3 == 0:
    if number > 10:
        print(f"{number} is divisible by 3 and greater than 10.")
    else:
        print(f"{number} is divisible by 3 but not greater than 10.")
elif number % 5 == 0:
    if number < 20:
        print(f"{number} is divisible by 5 and less than 20.")
    else:
        print(f"{number} is divisible by 5 but not less than 20.")
else:
    print(f"{number} is neither divisible by 2, 3, nor 5.")
