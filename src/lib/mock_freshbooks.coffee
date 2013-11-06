nodemock = require 'nodemock'

module.exports = class Freshbooks
  constructor: (base_uri, api_token) ->

    # Mock the functionality your plugin will need using nodemock.
    # This mock will be used if conf.get('simulate') == true
    #
    # See https://github.com/arunoda/nodemock for help
