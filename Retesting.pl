#!/usr/bin/perl
use strict;
use warnings;

# Simulated Action Logs Data
my %action_logs = (
    total_count       => 10,  # Total count of entries
    published_entries => [ 'Entry1', 'Entry2', 'Entry3', 'Entry4', 'Entry5', 
                           'Entry6', 'Entry7', 'Entry8', 'Entry9', 'Entry10' ],
    closed_entries    => [],
);

# Function to Mark Entries as Closed
sub mark_as_closed {
    my ($entry_name) = @_;
    
    # Check if the entry exists in the published list
    my @published = @{$action_logs{published_entries}};
    my ($index) = grep { $published[$_] eq $entry_name } 0..$#published;
    
    if (defined $index) {
        # Move entry to closed list
        push(@{$action_logs{closed_entries}}, $entry_name);
        splice(@{$action_logs{published_entries}}, $index, 1);
        $action_logs{total_count}--; # Decrease the count
        print "Marked '$entry_name' as Closed.\n";
    } else {
        print "Error: '$entry_name' not found in Published Entries.\n";
    }
}

# Function to Display Current Status of Logs
sub display_action_logs {
    print "\n=== Current Action Logs ===\n";
    print "Total Count: $action_logs{total_count}\n";
    print "Published Entries: ", join(", ", @{$action_logs{published_entries}}), "\n";
    print "Closed Entries: ", join(", ", @{$action_logs{closed_entries}}), "\n";
    print "===========================\n";
}

# Main Execution
print "Initial Action Logs:\n";
display_action_logs();

# Marking Entries as Closed
mark_as_closed('Entry3');
mark_as_closed('Entry7');
mark_as_closed('Entry10');

# Check Updated Action Logs
print "\nAfter Marking Entries as Closed:\n";
display_action_logs();

# Simulating an Inconsistent Scenario
print "\nSimulating Inconsistent Behavior...\n";
$action_logs{total_count} = $action_logs{total_count}; # Deliberately not updating count
print "Updated Total Count without proper logic.\n";

# Final Status
display_action_logs();

