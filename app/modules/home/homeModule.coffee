homeModule = angular.module('artdomApp.home', [])


homeModule.config(['$routeProvider', ($routeProvider) ->

  $routeProvider
  .when('/home',
    templateUrl: './modules/shop/templates/shop.html'
  )

])
