# freshbooks-cli-time-entry 
[![Build Status](https://secure.travis-ci.org/logankoester/freshbooks-cli-time-entry.png?branch=master)](http://travis-ci.org/logankoester/freshbooks-cli-time-entry)

> A command-line interface for interacting with Freshbooks Time Entries

## Overview

[freshbooks-cli](https://github.com/logankoester/freshbooks-cli) is a
command-line interface to the [FreshBooks](http://freshbooks.com/) API.

`freshbooks-cli-time-entry` implements the `time-entry` subcommand for
[freshbooks-cli](https://github.com/logankoester/freshbooks-cli).


## Usage

    --list, -l - Display a list of time entries
    --help, -h - Display this message


## Examples

    # Printing a list of time entries
    $ freshbooks time-entry --list
    id hours date       billed notes
    1  8     2013-11-05 0      Example entry


## Contributing

The test suite is implemented with
[nodeunit](https://github.com/caolan/nodeunit) and
[nixt](https://github.com/vesln/nixt).

To rebuild & run the tests

    $ git clone https://github.com/logankoester/freshbooks-cli-time-entry.git
    $ cd freshbooks-cli-time-entry
    $ npm install
    $ grunt test

You can use `grunt watch` to automatically rebuild and run the test suite when
files are changed.

Use `npm link` from the project directory to tell `freshbooks-cli` to use
your modified `freshbooks-cli-time-entry` during development.

To contribute back, fork the repo and open a pull request with your changes.


## License

Copyright (c) 2013 Logan Koester
Licensed under the MIT license.


