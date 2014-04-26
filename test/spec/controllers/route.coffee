'use strict'

describe 'Controller: RouteCtrl', () ->

  # load the controller's module
  beforeEach module 'julkisetAngularjsApp'

  RouteCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    RouteCtrl = $controller 'RouteCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', () ->
    expect(scope.awesomeThings.length).toBe 3
