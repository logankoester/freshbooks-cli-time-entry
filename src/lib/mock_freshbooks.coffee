nodemock = require 'nodemock'

module.exports = class Freshbooks
  constructor: (base_uri, api_token) ->

  Time_Entry: class Time_Entry
    constructor: ->
      return nodemock
        .mock('list')
        .takes (err, time_entries) ->
          time_entries
        .calls(0, [
          undefined, [
            {
              time_entry_id: 1,
              staff_id: 1,
              project_id: 1,
              task_id: 1,
              hours: 8.0,
              date: '2013-11-05',
              billed: 0,
              notes: 'Simulated entry'
            }
          ]
        ])
