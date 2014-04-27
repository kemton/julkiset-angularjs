'use strict'

angular.module('julkisetApp')
	.controller 'MainCtrl', ($scope, $location) ->
		$scope.submitForm = ->
			$location.path('/route/'+$scope.from+'/'+$scope.to+'/'+$scope.date+'/'+$scope.time+'/'+$scope.time_method)
