'use strict'

angular.module('julkisetApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ngRoute',
  'config'
])
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .when '/route/:from/:to/:date/:time/:time_method',
        templateUrl: 'views/route.html'
        controller: 'RouteCtrl'
      .otherwise
        redirectTo: '/'
