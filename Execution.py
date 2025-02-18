Here is the equivalent Python code:
```
import sys

# Simulated Action Logs Data
action_logs = {
    'total_count': 10,
    'published_entries': ['Entry1', 'Entry2', 'Entry3', 'Entry4', 'Entry5', 'Entry6', 'Entry7', 'Entry8', 'Entry9', 'Entry10'],
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
        published.pop(index)
        action_logs['total_count'] -= 1
        print(f"Marked '{entry_name}' as Closed.")
    else:
        print("Error: '{entry_name}' not found in Published Entries.")

# Function to Display Current Status of Logs
def display_action_logs():
    print("\n=== Current Action Logs ===")
    print(f"Total Count: {action_logs['total_count']}")
    print(f"Published Entries: {' '.join(action_logs['published_entries'])}\n")
    print(f"Closed Entries: {' '.join(action_logs['closed_entries'])}")
    print("===========================\n")

# Main Execution
print("Initial Action Logs:\n")
display_action_logs()

# Marking Entries as Closed
mark_as_closed('Entry3')
mark_as_closed('Entry7')
mark_as_closed('Entry10')
```
Note: The equivalent Python code uses a dictionary instead of a hash to store the action logs data. Additionally, the `display_action_logs()` function has been modified to use the `f-string` notation for formatting the output message.