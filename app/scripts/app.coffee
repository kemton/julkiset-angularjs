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
        controller: 'MainController'
      .when '/route/:from/:to/:date/:time/:time_method',
        templateUrl: 'views/route.html'
        controller: 'RouteController'
      .otherwise
        redirectTo: '/'
