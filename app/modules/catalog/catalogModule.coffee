catalogModule = angular.module('artdomApp.catalog', [])


catalogModule.config([
  '$routeProvider'

  ($routeProvider) ->

    $routeProvider
    .when('/katalog',
      templateUrl: './modules/catalog/templates/catalog.html',
      controller: 'catalogCtrl'
    )
    .when('/katalog/:hash',
      templateUrl: './modules/catalog/templates/catalog.html',
      controller: 'catalogCtrl'
    )

])

