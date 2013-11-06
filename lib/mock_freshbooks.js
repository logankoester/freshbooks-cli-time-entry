(function() {
  var Freshbooks, fs, nodemock, _;

  nodemock = require('nodemock');

  fs = require('fs');

  _ = require('lodash');

  module.exports = Freshbooks = (function() {
    var Time_Entry;

    function Freshbooks(base_uri, api_token) {}

    Freshbooks.prototype.Time_Entry = Time_Entry = (function() {
      function Time_Entry() {
        var mocked;
        mocked = nodemock.mock('list').takes(function(err, time_entries) {
          return time_entries;
        }).calls(0, [
          void 0, [
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
        ]);
        mocked.mock('create').takes(function(err, time_entry) {
          return time_entry;
        }).calls(0, [
          null, _.extend(mocked, {
            time_entry_id: 999
          })
        ]);
        return mocked;
      }

      return Time_Entry;

    })();

    return Freshbooks;

  })();

}).call(this);
