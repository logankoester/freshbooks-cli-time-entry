_ = require 'lodash'
async = require 'async'

exports.create = (@freshbooks, data, every, after) ->
  data = [data] unless _.isArray(data)
  time_entries = []

  async.each data, (i, done) =>
    entry = _.extend new @freshbooks.Time_Entry(), i
    entry.create (err, time_entry) ->
      every(err, time_entry)
      time_entries.push time_entry
      done()
  , (err) ->
    after(err, time_entries)


exports.formatters =
  log: (time_entry) ->
    "Time Entry with id '#{time_entry.time_entry_id}' created."

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
