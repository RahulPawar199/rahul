Here's the equivalent Python code for the given Perl code:

```
#!/usr/bin/env python

import math

def main():
    number = 15

    if number % 2 == 0:
        print(f"{number} is even.")
    elif number % 3 == 0 and number > 10:
        print(f"{number} is divisible by 3 and greater than 10.")
    elif number % 3 == 0 and number < 20:
        print(f"{number} is divisible by 3 and less than 20.")
    elif number % 5 == 0 and number < 20:
        print(f"{number} is divisible by 5 and less than 20.")
    else:
        print(f"{number} is neither divisible by 2, 3, nor 5.")

if __name__ == "__main__":
    main()
```
The above Python code has the same functionality as the given Perl code. Note that we have used the math module in Python to perform mathematical operations on the number variable. The if-else statements are equivalent to the Perl elsif and else blocks. Additionally, we have used formatted strings using f-strings (f"{number} is divisible by 3 and greater than 10.") for more readable code.