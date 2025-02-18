#!/usr/bin/perl
use strict;
use warnings;
use threads;
use Thread::Queue;
use JSON;
use Text::CSV;
use Getopt::Long;

# ------------------------------
# CONFIGURABLE SETTINGS
# ------------------------------
my $log_file;
my $output_json = "log_analysis.json";
my $output_csv  = "log_analysis.csv";
my $num_threads = 4;
my $filter_ip   = "";
my $filter_url  = "";
my $verbose     = 0;

GetOptions(
    "log=s"     => \$log_file,
    "json=s"    => \$output_json,
    "csv=s"     => \$output_csv,
    "threads=i" => \$num_threads,
    "ip=s"      => \$filter_ip,
    "url=s"     => \$filter_url,
    "verbose"   => \$verbose,
) or die "Invalid options provided!\n";

if (!$log_file) {
    die "Usage: perl log_analyzer.pl --log=<logfile> [--json=<output.json>] [--csv=<output.csv>] [--threads=4] [--ip=192.168.1.1] [--url=/home] [--verbose]\n";
}

# ------------------------------
# DATA STRUCTURES
# ------------------------------
my %ip_requests;
my %url_requests;
my %error_codes;
my $queue = Thread::Queue->new();

# ------------------------------
# REGULAR EXPRESSION FOR LOG PARSING
# ------------------------------
my $log_pattern = qr/^(\d+\.\d+\.\d+\.\d+) .* "(GET|POST|PUT|DELETE) (\S+) .*" (\d+) \d+/;

# ------------------------------
# THREAD WORKER FUNCTION
# ------------------------------
sub process_log {
    while (defined(my $line = $queue->dequeue())) {
        chomp $line;

        if ($line =~ $log_pattern) {
            my ($ip, $method, $url, $status) = ($1, $2, $3, $4);

            # Apply filters if needed
            next if ($filter_ip && $ip ne $filter_ip);
            next if ($filter_url && $url !~ /\Q$filter_url\E/);

            $ip_requests{$ip}++;
            $url_requests{$url}++;
            $error_codes{$status}++ if $status >= 400;

            print "Processed: $ip - $method $url - $status\n" if $verbose;
        }
    }
}

# ------------------------------
# MULTI-THREADED LOG READING
# ------------------------------
my @threads;
open my $fh, '<', $log_file or die "Could not open file '$log_file': $!\n";

while (my $line = <$fh>) {
    $queue->enqueue($line);
}
close $fh;

# Start worker threads
for (1 .. $num_threads) {
    push @threads, threads->create(\&process_log);
}

# Wait for all threads to finish
foreach my $t (@threads) {
    $t->join();
}

# ------------------------------
# OUTPUT RESULTS
# ------------------------------
sub generate_report {
    my %report = (
        top_ips    => [ sort { $ip_requests{$b} <=> $ip_requests{$a} } keys %ip_requests ],
        top_urls   => [ sort { $url_requests{$b} <=> $url_requests{$a} } keys %url_requests ],
        error_codes => \%error_codes,
    );

    return \%report;
}

# Generate JSON Output
sub write_json {
    my $data = generate_report();
    open my $json_fh, '>', $output_json or die "Could not write to JSON file: $!\n";
    print $json_fh encode_json($data);
    close $json_fh;
    print "JSON Report Saved: $output_json\n";
}

# Generate CSV Output
sub write_csv {
    my $csv = Text::CSV->new({ binary => 1, eol => "\n" });

    open my $csv_fh, '>', $output_csv or die "Could not write to CSV file: $!\n";
    $csv->print($csv_fh, ["IP Address", "Request Count"]);
    foreach my $ip (sort { $ip_requests{$b} <=> $ip_requests{$a} } keys %ip_requests) {
        $csv->print($csv_fh, [$ip, $ip_requests{$ip}]);
    }

    $csv->print($csv_fh, []);
    $csv->print($csv_fh, ["Requested URL", "Request Count"]);
    foreach my $url (sort { $url_requests{$b} <=> $url_requests{$a} } keys %url_requests) {
        $csv->print($csv_fh, [$url, $url_requests{$url}]);
    }

    $csv->print($csv_fh, []);
    $csv->print($csv_fh, ["HTTP Status Code", "Occurrences"]);
    foreach my $code (sort { $a <=> $b } keys %error_codes) {
        $csv->print($csv_fh, [$code, $error_codes{$code}]);
    }

    close $csv_fh;
    print "CSV Report Saved: $output_csv\n";
}

write_json();
write_csv();

# ------------------------------
# DISPLAY REPORT SUMMARY
# ------------------------------
print "\n========= LOG ANALYSIS SUMMARY =========\n";
print "Top 5 IP Addresses:\n";
foreach my $ip (sort { $ip_requests{$b} <=> $ip_requests{$a} } keys %ip_requests) {
    printf "%-15s %d requests\n", $ip, $ip_requests{$ip};
    last if --$num_threads == 0;
}
print "\n";

print "Top 5 Requested URLs:\n";
foreach my $url (sort { $url_requests{$b} <=> $url_requests{$a} } keys %url_requests) {
    printf "%-30s %d requests\n", $url, $url_requests{$url};
    last if --$num_threads == 0;
}
print "\n";

print "Error Code Summary:\n";
foreach my $code (sort { $a <=> $b } keys %error_codes) {
    print "HTTP $code: $error_codes{$code} occurrences\n";
}
print "\n========================================\n";
