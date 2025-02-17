#!/usr/bin/perl
use strict;
use warnings;

# Function to generate a multiplication table up to a given number
sub generate_multiplication_table {
    my ($size) = @_;
    my @table;

    for my $i (1 .. $size) {
        for my $j (1 .. $size) {
            $table[$i][$j] = $i * $j;
        }
    }

    return \@table;
}

# Function to print a formatted multiplication table
sub print_multiplication_table {
    my ($table, $size) = @_;

    print "Multiplication Table (Size: $size x $size):\n";
    for my $i (1 .. $size) {
        for my $j (1 .. $size) {
            printf "%4d", $table->[$i][$j];
        }
        print "\n";
    }
}

# Function with deeply nested loops and conditional logic
sub process_nested_logic {
    my ($size) = @_;
    
    for my $i (1 .. $size) {
        for my $j (1 .. $size) {
            for my $k (1 .. $size) {
                if (($i + $j + $k) % 2 == 0) {
                    print "Even Sum: $i, $j, $k -> ", $i * $j * $k, "\n";
                } else {
                    print "Odd Sum: $i, $j, $k -> Skipping\n";
                }
            }
        }
    }
}

# Main execution
my $size = 5;  # Define table size
my $table_ref = generate_multiplication_table($size);
print_multiplication_table($table_ref, $size);
process_nested_logic($size);
