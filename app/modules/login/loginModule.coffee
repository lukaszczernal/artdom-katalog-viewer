loginModule = angular.module('artdomApp.login', [])


loginModule.config(['$routeProvider', ($routeProvider) ->

  $routeProvider
  .when('/login',
    templateUrl: './modules/login/templates/login.html',
    controller: 'loginCtrl'
  # .when('/logout',
  #   templateUrl: './modules/login/templates/login.html',
  #   resolve

  )

])
