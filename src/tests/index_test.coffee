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
