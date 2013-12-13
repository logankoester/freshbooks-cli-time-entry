# FreshBooks: CLI Time Entry
> A command-line interface for interacting with Freshbooks Time Entries

[![Build Status](https://secure.travis-ci.org/logankoester/freshbooks-cli-time-entry.png?branch=master)](http://travis-ci.org/logankoester/freshbooks-cli-time-entry)
[![status](https://sourcegraph.com/api/repos/github.com/logankoester/freshbooks-cli-time-entry/badges/status.png)](https://sourcegraph.com/github.com/logankoester/freshbooks-cli-time-entry)
[![Dependency Status](https://david-dm.org/logankoester/freshbooks-cli-time-entry.png)](https://david-dm.org/logankoester/freshbooks-cli-time-entry)
[![devDependency Status](https://david-dm.org/logankoester/freshbooks-cli-time-entry/dev-status.png)](https://david-dm.org/logankoester/freshbooks-cli-time-entry#info=devDependencies)
[![Gittip](http://img.shields.io/gittip/logankoester.png)](https://www.gittip.com/logankoester/)

[![NPM](https://nodei.co/npm/freshbooks-cli-time-entry.png?downloads=true)](https://nodei.co/npm/freshbooks-cli-time-entry/)

## Overview

[freshbooks-cli](https://github.com/logankoester/freshbooks-cli) is a
command-line interface to the [FreshBooks](http://freshbooks.com/) API.

`freshbooks-cli-time-entry` implements the `time-entry` subcommand for
[freshbooks-cli](https://github.com/logankoester/freshbooks-cli).


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


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/logankoester/freshbooks-cli-time-entry/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

[![xrefs](https://sourcegraph.com/api/repos/github.com/logankoester/freshbooks-cli-time-entry/badges/xrefs.png)](https://sourcegraph.com/github.com/logankoester/freshbooks-cli-time-entry)
[![funcs](https://sourcegraph.com/api/repos/github.com/logankoester/freshbooks-cli-time-entry/badges/funcs.png)](https://sourcegraph.com/github.com/logankoester/freshbooks-cli-time-entry)
[![top func](https://sourcegraph.com/api/repos/github.com/logankoester/freshbooks-cli-time-entry/badges/top-func.png)](https://sourcegraph.com/github.com/logankoester/freshbooks-cli-time-entry)
[![library users](https://sourcegraph.com/api/repos/github.com/logankoester/freshbooks-cli-time-entry/badges/library-users.png)](https://sourcegraph.com/github.com/logankoester/freshbooks-cli-time-entry)
[![authors](https://sourcegraph.com/api/repos/github.com/logankoester/freshbooks-cli-time-entry/badges/authors.png)](https://sourcegraph.com/github.com/logankoester/freshbooks-cli-time-entry)
[![Total views](https://sourcegraph.com/api/repos/github.com/logankoester/freshbooks-cli-time-entry/counters/views.png)](https://sourcegraph.com/github.com/logankoester/freshbooks-cli-time-entry)
[![Views in the last 24 hours](https://sourcegraph.com/api/repos/github.com/logankoester/freshbooks-cli-time-entry/counters/views-24h.png)](https://sourcegraph.com/github.com/logankoester/freshbooks-cli-time-entry)
