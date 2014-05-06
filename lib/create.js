(function() {
  var async, _;

  _ = require('lodash');

  async = require('async');

  exports.create = function(freshbooks, data, every, after) {
    var time_entries;
    this.freshbooks = freshbooks;
    if (!_.isArray(data)) {
      data = [data];
    }
    time_entries = [];
    return async.each(data, (function(_this) {
      return function(i, done) {
        var entry;
        entry = _.extend(new _this.freshbooks.Time_Entry(), i);
        return entry.create(function(err, time_entry) {
          every(err, time_entry);
          time_entries.push(time_entry);
          return done();
        });
      };
    })(this), function(err) {
      return after(err, time_entries);
    });
  };

  exports.formatters = {
    log: function(time_entry) {
      return "Time Entry with id '" + time_entry.time_entry_id + "' created.";
    },
    table: function(time_entries) {
      var cliff, keys, list;
      _ = require('lodash');
      cliff = require('cliff');
      keys = ['id', 'hours', 'date', 'billed', 'notes'];
      list = _.map(time_entries, function(time_entry) {
        return [time_entry.time_entry_id, time_entry.hours, time_entry.date, time_entry.billed, time_entry.notes];
      });
      list.unshift(keys);
      return cliff.stringifyRows(list, ['white', 'blue', 'blue', 'green', 'yellow']);
    }
  };

}).call(this);
