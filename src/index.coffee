path = require 'path'
nopt = require 'nopt'
conf = require('freshbooks-cli-config').getConf()
exec = require('child_process').exec

displayHelp = ->
  manpage = path.join(__dirname, 'man', 'freshbooks-time-entry.1')
  cmd = "man --local-file #{manpage}"
  exec cmd, (err, stdout, stderr) ->
    process.stdout.write "#{stdout}"
    process.stderr.write "#{stderr}"
    console.error err if err

getFreshbooks = ->
  if conf.get 'simulate'
    Freshbooks = require './lib/mock_freshbooks'
  else
    Freshbooks = require 'freshbooks'
  base_uri = "#{conf.get('api:url')}/#{conf.get('api:version')}/xml-in"
  return new Freshbooks base_uri, conf.get('api:token')

parsedOptions = nopt
  list:   Boolean
  create: Boolean
  data:   String
  help:   Boolean
,
  l: ['--list']
  c: ['--create']
  h: ['--help']
, process.argv, 2

if parsedOptions.help
  displayHelp()

else if parsedOptions.create

  create = require './lib/create'

  every = (err, time_entry) ->
    console.error err if err
    console.log create.formatters.log(time_entry)

  after = (err, new_entries) ->
    console.error err if err
    console.log create.formatters.table(new_entries)

  if data = parsedOptions.data
    create.create getFreshbooks(), JSON.parse(data), every, after
  else
    data = ''
    process.stdin.on 'data', (chunk) -> data += chunk
    process.stdin.on 'end', ->
      create.create getFreshbooks(), JSON.parse(data), every, after

else if parsedOptions.list

  list = require './lib/list'
  list.get getFreshbooks(), (err, time_entries) ->
    console.error if err
    console.log list.formatters.table(time_entries)

else
  displayHelp()
