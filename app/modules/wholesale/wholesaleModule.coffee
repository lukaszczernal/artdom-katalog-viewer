wholesaleModule = angular.module('artdomApp.wholesale', [])


wholesaleModule.config(['$routeProvider', ($routeProvider) ->

  $routeProvider
  .when('/hurtownia',
    templateUrl: './modules/wholesale/templates/wholesale.html',
    controller: 'wholesaleCtrl'
  )

])
