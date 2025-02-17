
Here's the equivalent Python code:
```python
#!/usr/bin/env python

def generate_multiplication_table(size):
    table = []

    for i in range(1, size + 1):
        row = []
        for j in range(1, size + 1):
            product = i * j
            row.append(product)
        table.append(row)

    return table

def print_multiplication_table(table, size):
    print("Multiplication Table (Size: {} x {})".format(size, size))
    for i in range(1, size + 1):
        row = []
        for j in range(1, size + 1):
            product = table[i][j]
            row.append(product)
        print(" ".join([str(x) for x in row]))
    print()

def process_nested_logic(size):
    for i in range(1, size + 1):
        for j in range(1, size + 1):
            for k in range(1, size + 1):
                if ((i + j + k) % 2 == 0):
                    print("Even Sum: {}, {}, {} -> {}"
                          .format(i, j, k, i * j * k))
                else:
                    print("Odd Sum: {}, {}, {} -> Skipping"
                          .format(i, j, k))

if __name__ == "__main__":
    size = 5 # Define table size
    table_ref = generate_multiplication_table(size)
    print_multiplication_table(table_ref, size)
    process_nested_logic(size)
```
Note that in Python, we don't need to use `my` to declare variables, and instead we use the assignment operator `=` to assign values. Additionally, we use the `range()` function to generate sequences of numbers instead of using loops with indexes.
