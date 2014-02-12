#/*global require*/
'use strict'

require.config
  shim:
    asEvented:
      exports: 'asEvented'
  paths:
    asEvented: '../bower_components/asEvented/asevented'

require ['./eventAggregator'], (eventAgg)->
