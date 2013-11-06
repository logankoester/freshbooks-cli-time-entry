nixt = require 'nixt'

showHelp = (result) ->
  if !(result.stdout.match(/--help/))
    return new Error('--help should be mentioned')

exports.group =

  'No options': (test) ->
    test.doesNotThrow ->
      nixt()
        .expect(showHelp)
        .run('bin/freshbooks-time-entry')
        .code(0)
        .end(test.done)

  '--help': (test) ->
    test.doesNotThrow ->
      nixt()
        .expect(showHelp)
        .run('bin/freshbooks-time-entry --help')
        .code(0)
        .end(test.done)

  '--list': (test) ->
    test.doesNotThrow ->
      nixt()
        .expect (result) ->
          if !(result.stdout.match(/Simulated entry/))
            return new Error('Simulated time entry should be listed')
        .run('freshbooks_config=tests/config_file bin/freshbooks-time-entry --list')
        .code(0)
        .end(test.done)

  '--create (--data)': (test) ->

    env = 'freshbooks_config=tests/config_file'

    json = JSON.stringify [
      {
        project_id: 1
        task_id: 1
        staff_id: 1
        hours: 4.5
        notes: 'first'
        date: '2013-11-05'
      }, {
        project_id: 1
        task_id: 1
        notes: 'second'
      }
    ]

    test.doesNotThrow ->
      nixt()
        .expect (result) ->
          if !(result.stdout.match(/first/))
            return new Error('first entry should be logged to STDOUT')
        .expect (result) ->
          if !(result.stdout.match(/second/))
            return new Error('second entry should be logged to STDOUT')
        .run("#{env} bin/freshbooks-time-entry --create --data '#{json}'")
        .code(0)
        .end(test.done)
