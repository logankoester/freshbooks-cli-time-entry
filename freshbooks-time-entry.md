# freshbooks-time-entry 

> A command-line interface for interacting with Freshbooks Time Entries

## Usage

    --list, -l   - Display a list of time entries

    --create, -c - Create one or more time entries from JSON data, either
                   read from STDIN or passed to --data as a string

    --data JSON - Time entry data for --create

    --help, -h - Display this message

See http://developers.freshbooks.com/docs/time-entries/ for more information.


## Examples

    # Printing a list of time entries
    $ freshbooks time-entry --list
    id hours date       billed notes
    1  8     2013-11-05 0      Example entry

    # Create some entries from a JSON file
    $ cat entries.json | freshbooks time-entry --create


