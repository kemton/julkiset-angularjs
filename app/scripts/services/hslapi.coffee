'use strict'

angular.module('julkisetAngularjsApp')
	.service 'HslApi', ($http, ENV) ->
		apiProxy = 'http://jsonp.jit.su/?url=' # Hsl Endpoint API not support cors.. stupid thing but I have to do in that way
		url = apiProxy + encodeURIComponent(ENV.apiEndpoint + '?user=' + ENV.username + '&pass=' + ENV.password + '&format=json')
		HslApi =
			getRoute: (from, to) ->
				$http.get(url+'&request=route&epsg_in=wgs84&epsg_out=wgs84&from=25.0072037931,60.261470866997&to=24.933745146692,60.201608480305')
				.success()
			getGeocoding: (key) ->
				#$http.defaults.headers.common['X-Requested-With'] = "XMLHttpRequest"
				#$http.defaults.headers.common["X-Custom-Header"] = "XMLHttpRequest"
				$http.get(url + encodeURIComponent('&request=geocode&key='+key))
				.error (data, status, headers, config) ->
					console.log data, status, headers, config
				.then (response) ->
					response.data
