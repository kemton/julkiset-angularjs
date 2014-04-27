'use strict'

describe 'Service: Hslapi', () ->

  # load the service's module
  beforeEach module 'julkisetAngularjsApp'

  # instantiate service
  Hslapi = {}
  beforeEach inject (_Hslapi_) ->
    Hslapi = _Hslapi_

  it 'should do something', () ->
    expect(!!Hslapi).toBe true
