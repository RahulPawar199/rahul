use strict;
use warnings;

# Subroutine to read a file and return lines
sub read_file {
    my ($file_name) = @_;
    open my $fh, '<', $file_name or die "Cannot open file: $!";
    my @lines = <$fh>;
    close $fh;
    return @lines;
}

# Subroutine to count words in a line
sub count_words {
    my ($line) = @_;
    my @words = split /\s+/, $line;
    return scalar @words;
}

# Subroutine to count unique words
sub count_unique_words {
    my ($lines_ref) = @_;
    my %word_count;
    foreach my $line (@$lines_ref) {
        my @words = split /\s+/, $line;
        foreach my $word (@words) {
            $word =~ s/[^a-zA-Z0-9]//g; # Remove punctuation
            $word_count{lc $word}++ if $word;
        }
    }
    return %word_count;
}

# Subroutine to write results to a file
sub write_results {
    my ($file_name, $data_ref) = @_;
    open my $fh, '>', $file_name or die "Cannot open file: $!";
    foreach my $line (@$data_ref) {
        print $fh "$line\n";
    }
    close $fh;
}

# Main Program
print "Enter the input file name: ";
my $input_file = <STDIN>;
chomp $input_file;

print "Enter the output file name: ";
my $output_file = <STDIN>;
chomp $output_file;

my @lines = read_file($input_file);
my $total_lines = scalar @lines;
my $total_words = 0;

foreach my $line (@lines) {
    $total_words += count_words($line);
}

my %unique_words = count_unique_words(\@lines);

my @output_data = (
    "Total lines: $total_lines",
    "Total words: $total_words",
    "Unique words and their frequencies:",
);
foreach my $word (sort keys %unique_words) {
    push @output_data, "$word: $unique_words{$word}";
}

write_results($output_file, \@output_data);

print "Analysis complete. Results saved to $output_file.\n";
