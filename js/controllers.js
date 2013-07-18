'use strict';

HomeController.$inject = ['$scope', '$location'];
function HomeController($scope, $location) {
	$scope.submitForm = function() {
		$location.path('/route-options/'+$scope.from+'/'+$scope.to+'/'+$scope.date+'/'+$scope.time+'/'+$scope.timetype);
	};
}

RouteController.$inject = ['$scope', '$routeParams', '$http', 'HslApi', 'Route'];
function RouteController($scope, $routeParams, $http, HslApi, Route) {
	$scope.fromLocationList = null;
	$scope.toLocationList = null;
	if ($scope.fromLocationList == null) {
		HslApi.getGeocoding($routeParams.from).then(function(data){
			$scope.fromLocationList = data;
			$scope.locationsList = $scope.fromLocationList;
			$scope.locationMethod = "from";
			$scope.openModal();
		});
	} else {
		HslApi.getGeocoding($routeParams.to).then(function(data){
			$scope.toLocationList = data.data;
			$scope.locationsList = $scope.toLocationList;
			$scope.locationMethod = "to";
			$scope.openModal();
		});
	}

	$scope.openModal = function () {
		$scope.chooseLocationModalOpen = true;
	};

	$scope.closeModal = function () {
		$scope.chooseLocationModalOpen = false;
	};

	$scope.options = {
		backdropFade: true,
		dialogFade:true
	};


	$scope.saveLocation = function(method, location) {
		// new prototype instance
		if (method == "from") {
			Route.setFromLocation(location);
			console.log(Route.getFromLocation());
		} else if (method == "to") {
			Route.setToLocation(location);
		}
		$scope.closeModal();
	};

}

app.service('Route', function() {
	var routeData = {};
	return {
		setFromLocation: function(location) {
			routeData.fromLocation = location;
		},
		getFromLocation: function(location) {
			return routeData;
		},
		setToLocation: function(location) {
			routeData.toLocation = location;
		}
	};
});


app.service('HslApi', function($http) {
	var apiProxy = 'http://jsonp.jit.su/?url=';
	var url = apiProxy + encodeURIComponent('http://api.reittiopas.fi/hsl/prod/?user=nkiuru&pass=asdasd123&format=json');
	var HslApi = {
		getRoute: function(from, to) {
			$http.get(url+'&request=route&epsg_in=wgs84&epsg_out=wgs84&from=25.0072037931,60.261470866997&to=24.933745146692,60.201608480305')
			.success();
		},
		getGeocoding: function(key) {
			delete $http.defaults.headers.common['X-Requested-With'];
			//var dataSource = url + encodeURIComponent('&request=geocode&key='+key);
			var dataSource = 'location.json';
			return $http.get(dataSource)
			.then(function(response) {
				return response.data;
			});
		}
	};
	return HslApi;
});

