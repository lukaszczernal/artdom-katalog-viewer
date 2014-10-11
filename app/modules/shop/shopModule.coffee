shopModule = angular.module('artdomApp.shop', [])


shopModule.config(['$routeProvider', ($routeProvider) ->

  $routeProvider
  .when('/sklep-nysa',
    templateUrl: './modules/shop/templates/shop.html',
    controller: 'shopCtrl'
  )

])
