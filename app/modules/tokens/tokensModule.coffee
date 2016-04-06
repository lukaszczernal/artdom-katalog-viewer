tokensModule = angular.module('artdomApp.tokens', ['xeditable'])


tokensModule.config([
  '$routeProvider'

  ($routeProvider) ->

    $routeProvider
    .when('/tokens',
      templateUrl: './modules/tokens/templates/tokens.html',
      controller: 'tokensCtrl'
      requireLogin: true
      resolve:
        'authentication': ['User', (User) ->
          User.getCurrentUser()
        ]
    )

])
