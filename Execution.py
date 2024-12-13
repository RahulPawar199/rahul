 Here is the Python code for the same: 

```
#!/usr/bin/python
# -*- coding: utf-8 -*-

"""Simulated Action Logs Data."""

import warnings
warnings.simplefilter('once')

def main():
    """Mark entries as closed in action logs and display current status."""
    # Simulated Action Logs Data
    action_logs = {
        'total_count': 10,
        'published_entries': ['Entry1', 'Entry2', 'Entry3', 'Entry4', 'Entry5', 'Entry6', 'Entry7', 'Entry8', 'Entry9', 'Entry10'],
        'closed_entries': [],
    }
    print("Initial Action Logs:\n")
    display_action_logs(action_logs)

    mark_as_closed(action_logs, 'Entry3')
    mark_as_closed(action_logs, 'Entry7')
    mark_as_closed(action_logs, 'Entry10')

def display_action_logs(action_logs):
    """Displays the current status of action logs."""
    print('\n=== Current Action Logs ===\n')
    print('Total Count: {}'.format(len(action_logs['published_entries'])))
    print('Published Entries: {}\n'.format(', '.join(action_logs['published_entries'])))
    print('Closed Entries: {}\n'.format(', '.join(action_logs['closed_entries'])))

def mark_as_closed(action_logs, entry_name):
    """Marks an entry as closed in the action logs."""
    try:
        index = action_logs['published_entries'].index(entry_name)
        print('Marked \'{}\' as Closed.'.format(entry_name))
        del action_logs['published_entries'][index]
    except ValueError:
        print('Error: {} not found in Published Entries.'.format(entry_name))
        return -1
    except IndexError:
        print('Error: Index out of range.')
        return -1
    finally:
        action_logs['total_count'] -= 1

if __name__ == '__main__':
    main()
```
Note that the above code is not executable, but it is meant to be a starting point for you to convert the Perl code into Python. The `warnings` module in Python helps suppress warnings and it's used with a filter of `once`.
The main function contains comments to explain what it does.