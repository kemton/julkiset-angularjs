'use strict';

var app = angular.module('julkiset', ['ui.bootstrap']).
	config(['$routeProvider', function($routeProvider) {
	$routeProvider.
		when('/home', {templateUrl: 'partials/home.html', controller: HomeController}).
		when('/route-options/:from/:to/:date/:time/:timetype', {templateUrl: 'partials/route-options.html', controller: RouteController}).
		otherwise({redirectTo: '/home'});
}]);
