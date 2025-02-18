Here is the equivalent Python code:
```python
#!/usr/bin/python
import warnings
warnings.filterwarnings("ignore")

# Parent Class: Employee
class Employee():
    def __init__(self, name, salary):
        self._name = name
        self._salary = salary
    
    def get_name(self):
        return self._name
    
    def get_salary(self):
        return self._salary
    
    def show_details(self):
        return f"Employee: {self.get_name()}, Salary: {self.get_salary()}"

# Subclass: Manager (inherits from Employee)
class Manager(Employee):
    def __init__(self, name, salary, bonus):
        super().__init__(name, salary)
        self._bonus = bonus
    
    def get_bonus(self):
        return self._bonus
    
    def show_details(self):
        return super().show_details() + ", Bonus: " + str(self.get_bonus())

# Main Execution
if __name__ == "__main__":
    employee = Employee("John Doe", 50000)
    print(employee.show_details())

    manager = Manager("Alice Smith", 80000, 15000)
    print(manager.show_details())
```
Note that in Python, the `@` symbol is used to indicate a decorator, which is not used in Perl. Additionally, Python uses the `print()` function instead of `printf()` in C-style languages.