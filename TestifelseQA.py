Here is the Python code to convert:
```
#!/usr/bin/env python

import math

def main():
    number = 15

    if number % 2 == 0:
        print(f"{number} is even.")
    elif number % 3 == 0 and number > 10:
        print(f"{number} is divisible by 3 and greater than 10.")
    elif number % 5 == 0 and number < 20:
        print(f"{number} is divisible by 5 and less than 20.")
    else:
        print(f"{number} is neither divisible by 2, 3, nor 5.")

if __name__ == "__main__":
    main()
```