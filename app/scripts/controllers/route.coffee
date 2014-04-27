'use strict'

angular.module('julkisetAngularjsApp')
	.controller 'RouteCtrl', ($scope, $routeParams, $http, HslApi, Route) ->
		$scope.fromLocationList = null;
		$scope.toLocationList = null;

		if $scope.fromLocationList == null
			HslApi.getGeocoding($routeParams.from).then (data) ->
				$scope.fromLocationList = data
				$scope.locationsList = $scope.fromLocationList
				$scope.locationMethod = "from"
				$scope.openModal()
		else
			HslApi.getGeocoding($routeParams.to).then (data) ->
				$scope.toLocationList = data.data;
				$scope.locationsList = $scope.toLocationList;
				$scope.locationMethod = "to";
				$scope.openModal();

		$scope.openModal = ->
			$scope.chooseLocationModalOpen = true;

		$scope.closeModal = ->
			$scope.chooseLocationModalOpen = false;

		$scope.options =
			backdropFade: true,
			dialogFade:true

		$scope.saveLocation = (method, location) ->
			if method == "from"
				Route.setFromLocation(location)
			else if method == "to"
				Route.setToLocation(location)

			$scope.closeModal();
