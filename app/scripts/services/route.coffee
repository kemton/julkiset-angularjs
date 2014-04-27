'use strict'

angular.module('julkisetAngularjsApp')
	.service 'Route', () ->
		routeData = {}
		Route =
			setFromLocation: (location) ->
				routeData.fromLocation = location
			getFromLocation: (location) ->
				routeData
			setToLocation: (location) ->
				routeData.toLocation = location
