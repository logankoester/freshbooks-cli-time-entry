exports.get = (@freshbooks, callback) ->
  time_entry = new @freshbooks.Time_Entry
  time_entry.list callback

exports.formatters =
  table: (time_entries) ->
    _ = require 'lodash'
    cliff = require 'cliff'

    keys = [
      'id',
      'hours',
      'date',
      'billed',
      'notes'
    ]

    list = _.map time_entries, (time_entry) ->
      [
        time_entry.time_entry_id,
        time_entry.hours,
        time_entry.date,
        time_entry.billed,
        time_entry.notes
      ]

    list.unshift(keys)

    cliff.stringifyRows list, [
      'white',
      'blue',
      'blue',
      'green',
      'yellow'
    ]
