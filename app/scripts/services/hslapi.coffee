'use strict'

angular.module('julkisetAngularjsApp')
	.service 'HslApi', ($http, ENV) ->
			apiProxy = 'http://jsonp.jit.su/?url=';
			url = apiProxy + encodeURIComponent(ENV.apiEndpoint + '?user=nkiuru&pass=asdasd123&format=json');
			HslApi =
				getRoute: (from, to) ->
					$http.get(url+'&request=route&epsg_in=wgs84&epsg_out=wgs84&from=25.0072037931,60.261470866997&to=24.933745146692,60.201608480305')
					.success()
				getGeocoding: (key) ->
					delete $http.defaults.headers.common['X-Requested-With']
					dataSource = url + encodeURIComponent('&request=geocode&key='+key)
					$http.get(dataSource)
					.then (response) ->
						response.data
