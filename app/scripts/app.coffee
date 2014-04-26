'use strict'

angular.module('julkisetAngularjsApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ngRoute'
])
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .when '/route',
        templateUrl: 'views/route.html'
        controller: 'RouteCtrl'
      .otherwise
        redirectTo: '/'
