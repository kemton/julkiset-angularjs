'use strict'

angular.module('julkisetAngularjsApp')
	.controller 'MainCtrl', ($scope, $location) ->
		$scope.submitForm = ->
			$location.path('/route/'+$scope.from+'/'+$scope.to+'/'+$scope.date+'/'+$scope.time+'/'+$scope.time_method)
