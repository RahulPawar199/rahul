Here is the equivalent Python code:
```
def fibonacci(n):
    if n < 2:
        return n
    return fibonacci(n-1) + fibonacci(n-2)

print("Enter the number of terms: ")
terms = input()
if terms.isdigit():
    print("Fibonacci sequence:")
    for i in range(int(terms)):
        print(fibonacci(i), end=" ")
    print()
else:
    print("Please enter a valid number.")
```
Note that the Python code uses the `input()` function to get input from the user, and the `range()` function to generate a sequence of integers. The `isdigit()` method is used to check if the input is a valid integer.