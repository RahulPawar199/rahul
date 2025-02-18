Here is the Python code that corresponds to the given Perl code:
```python
import re

def read_file(filename):
    """Reads the contents of a file and returns the lines as a list"""
    with open(filename, 'r') as fp:
        return [line.strip() for line in fp]

def count_words(line):
    """Counts the number of words in a given line"""
    return len(re.split('\s+', line))

def count_unique_words(lines):
    """Counts the unique words in a list of lines and their frequencies"""
    word_count = {}
    for line in lines:
        for word in re.split('\s+', line):
            if word not in ['', None]:
                word = word.strip('^a-zA-Z0-9')
                if word != '':
                    word_count[word.lower()] = word_count.get(word, 0) + 1
    return word_count

def write_results(filename, data):
    """Writes a list of strings to a file"""
    with open(filename, 'w') as fp:
        for line in data:
            fp.write("{}\n".format(line))

if __name__ == "__main__":
    # Get the input and output filenames from the user
    input_file = input("Enter the input file name: ")
    chomp(input_file)
    output_file = input("Enter the output file name: ")
    chomp(output_file)
    
    # Read the contents of the input file and split it into lines
    lines = read_file(input_file)
    total_lines = len(lines)
    total_words = 0
    
    # Count the number of words in each line
    for line in lines:
        total_words += count_words(line)
        
    # Count the unique words and their frequencies in the input file
    unique_words = count_unique_words(lines)
    
    # Create a list of output data
    output_data = [
        "Total lines: {}".format(total_lines),
        "Total words: {}".format(total_words),
        "Unique words and their frequencies:",
    ]
    
    # Add the unique word counts to the output data
    for word, count in unique_words.items():
        output_data.append("{}: {}".format(word, count))
    
    # Write the output data to a file
    write_results(output_file, output_data)
    
    print("Analysis complete. Results saved to {}\n".format(output_file))
```
The Python code uses the `re` module for regular expressions to split the input lines into words and remove punctuation. It also uses the `chomp` function to strip newline characters from the input filenames. The rest of the code is similar to the Perl version, with some minor differences in the way the output file is written using the `write_results` function.