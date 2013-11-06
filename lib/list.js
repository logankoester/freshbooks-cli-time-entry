(function() {
  exports.get = function(freshbooks, callback) {
    var time_entry;
    this.freshbooks = freshbooks;
    time_entry = new this.freshbooks.Time_Entry;
    return time_entry.list(callback);
  };

  exports.formatters = {
    table: function(time_entries) {
      var cliff, keys, list, _;
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
