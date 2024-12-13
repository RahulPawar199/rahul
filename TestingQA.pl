sub fibonacci {
    my ($n) = @_;
    return $n if $n < 2;
    return fibonacci($n - 1) + fibonacci($n - 2);
}

print "Enter the number of terms: ";
my $terms = <STDIN>;
chomp($terms);

if ($terms =~ /^\d+$/) {
    print "Fibonacci sequence:\n";
    for my $i (0 .. $terms - 1) {
        print fibonacci($i), " ";
    }
    print "\n";
} else {
    print "Please enter a valid number.\n";
}
