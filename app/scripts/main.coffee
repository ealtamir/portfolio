#/*global require*/
'use strict'

require.config
  shim:
    asevented:
      exports: 'asEvented'
  paths:
    asevented: './'

require ['./eventAggregator'], (eventAgg) ->
