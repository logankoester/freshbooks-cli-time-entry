    # Printing a list of time entries
    $ freshbooks time-entry --list
    id hours date       billed notes
    1  8     2013-11-05 0      Example entry

    # Create some entries from a JSON file
    $ cat entries.json | freshbooks time-entry --create
