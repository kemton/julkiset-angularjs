'use strict'

describe 'Service: Route', () ->

  # load the service's module
  beforeEach module 'julkisetAngularjsApp'

  # instantiate service
  Route = {}
  beforeEach inject (_Route_) ->
    Route = _Route_

  it 'should do something', () ->
    expect(!!Route).toBe true
