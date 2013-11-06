(function() {
  var after, conf, create, data, displayHelp, every, exec, getFreshbooks, list, nopt, parsedOptions, path;

  path = require('path');

  nopt = require('nopt');

  conf = require('freshbooks-cli-config').getConf();

  exec = require('child_process').exec;

  displayHelp = function() {
    var cmd, manpage;
    manpage = path.join(__dirname, 'man', 'freshbooks-time-entry.1');
    cmd = "man --local-file " + manpage;
    return exec(cmd, function(err, stdout, stderr) {
      process.stdout.write("" + stdout);
      process.stderr.write("" + stderr);
      if (err) {
        return console.error(err);
      }
    });
  };

  getFreshbooks = function() {
    var Freshbooks, base_uri;
    if (conf.get('simulate')) {
      Freshbooks = require('./lib/mock_freshbooks');
    } else {
      Freshbooks = require('freshbooks');
    }
    base_uri = "" + (conf.get('api:url')) + "/" + (conf.get('api:version')) + "/xml-in";
    return new Freshbooks(base_uri, conf.get('api:token'));
  };

  parsedOptions = nopt({
    list: Boolean,
    create: Boolean,
    data: String,
    help: Boolean
  }, {
    l: ['--list'],
    c: ['--create'],
    h: ['--help']
  }, process.argv, 2);

  if (parsedOptions.help) {
    displayHelp();
  } else if (parsedOptions.create) {
    create = require('./lib/create');
    every = function(err, time_entry) {
      if (err) {
        console.error(err);
      }
      return console.log(create.formatters.log(time_entry));
    };
    after = function(err, new_entries) {
      if (err) {
        console.error(err);
      }
      return console.log(create.formatters.table(new_entries));
    };
    if (data = parsedOptions.data) {
      create.create(getFreshbooks(), JSON.parse(data), every, after);
    } else {
      data = '';
      process.stdin.on('data', function(chunk) {
        return data += chunk;
      });
      process.stdin.on('end', function() {
        return create.create(getFreshbooks(), JSON.parse(data), every, after);
      });
    }
  } else if (parsedOptions.list) {
    list = require('./lib/list');
    list.get(getFreshbooks(), function(err, time_entries) {
      if (err) {
        console.error;
      }
      return console.log(list.formatters.table(time_entries));
    });
  } else {
    displayHelp();
  }

}).call(this);
