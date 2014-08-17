tokensModule = angular.module('artdomApp.tokens', [])


tokensModule.config(['$routeProvider', ($routeProvider) ->

  $routeProvider
  .when('/tokens',
    templateUrl: './modules/tokens/templates/tokens.html',
    controller: 'tokensCtrl'
    requireLogin: true
  )

])

