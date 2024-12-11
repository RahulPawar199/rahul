try:
    numbers = [1, 2, 3, 4, 'five', 6, 9, 12, None, 15]
    squares_of_div_by_3 = [
        (lambda x: x**2)(num) for num in numbers 
        if isinstance(num, int) and num % 3 == 0
    ]    
    print(f"Squares of numbers divisible by 3: {squares_of_div_by_3}")
except Exception as e:
    print(f"An error occurred: {e}")
