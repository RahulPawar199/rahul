Here's the Python code equivalent of the given Perl script:
```python
#!/usr/bin/env python

import os

# Simulated Action Logs Data
action_logs = {
    'total_count': 10,  # Total count of entries
    'published_entries': ['Entry1', 'Entry2', 'Entry3', 'Entry4', 'Entry5',
                          'Entry6', 'Entry7', 'Entry8', 'Entry9', 'Entry10'],
    'closed_entries': []
}

# Function to Mark Entries as Closed
def mark_as_closed(entry_name):
    # Check if the entry exists in the published list
    published = action_logs['published_entries']
    index = next((i for i, x in enumerate(published) if x == entry_name), None)

    if index is not None:
        # Move entry to closed list
        action_logs['closed_entries'].append(entry_name)
        del published[index]
        action_logs['total_count'] -= 1  # Decrease the count
        print("Marked '{0}' as Closed.".format(entry_name))
    else:
        print("Error: '{0}' not found in Published Entries.".format(entry_name))

# Function to Display Current Status of Logs
def display_action_logs():
    print("\n=== Current Action Logs ===")
    print("Total Count: {0}\n".format(action_logs['total_count']))
    print("Published Entries: {0}".format(", ".join(action_logs['published_entries'])))
    print("Closed Entries: {0}".format(", ".join(action_logs['closed_entries'])))
    print("==========================")

# Main Execution
print("Initial Action Logs:")
display_action_logs()

# Marking Entries as Closed
mark_as_closed('Entry3')
mark_as_closed('Entry7')
mark_as_closed('Entry10')

# Check Updated Action Logs
print("\nAfter Marking Entries as Closed:")
display_action_logs()

# Simulating an Inconsistent Scenario
print("\nSimulating Inconsistent Behavior...")
action_logs['total_count'] = action_logs['total_count']  # Deliberately not updating count
print("Updated Total Count without proper logic.\n")

# Final Status
display_action_logs()
```
Please note that the Python script uses a dictionary to store the action logs data, which is more efficient than using an array. Also, the Python script has fewer lines of code compared to the Perl script.