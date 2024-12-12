my $x = 10;
my $y = 20;

if ($x > 5) {
    if ($y > 15) {
        if ($x + $y > 30) {
            print "Both x and y are large, and their sum is greater than 30.\n";
        } else {
            print "x and y are large, but their sum is not greater than 30.\n";
        }
    } else {
        print "x is large, but y is not greater than 15.\n";
    }
} else {
    print "x is not large.\n";
}
