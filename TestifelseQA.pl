use strict;
use warnings;

my $number = 15;

if ($number % 2 == 0) {
    print "$number is even.\n";
} elsif ($number % 3 == 0) {
    if ($number > 10) {
        print "$number is divisible by 3 and greater than 10.\n";
    } else {
        print "$number is divisible by 3 but not greater than 10.\n";
    }
} elsif ($number % 5 == 0) {
    if ($number < 20) {
        print "$number is divisible by 5 and less than 20.\n";
    } else {
        print "$number is divisible by 5 but not less than 20.\n";
    }
} else {
    print "$number is neither divisible by 2, 3, nor 5.\n";
}
