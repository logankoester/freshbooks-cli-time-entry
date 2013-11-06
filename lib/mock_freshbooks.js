(function() {
  var Freshbooks, nodemock;

  nodemock = require('nodemock');

  module.exports = Freshbooks = (function() {
    var Time_Entry;

    function Freshbooks(base_uri, api_token) {}

    Freshbooks.prototype.Time_Entry = Time_Entry = (function() {
      function Time_Entry() {
        return nodemock.mock('list').takes(function(err, time_entries) {
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
      }

      return Time_Entry;

    })();

    return Freshbooks;

  })();

}).call(this);
