tokensModule = angular.module('artdomApp.tokens', [])


tokensModule.config([
  '$routeProvider'

  ($routeProvider) ->

    $routeProvider
    .when('/tokens',
      templateUrl: './modules/tokens/templates/tokens.html',
      controller: 'tokensCtrl'
      requireLogin: true
      resolve:
        'authentication': ['$location','User','$q', ($location, User, $q) ->
          deferred = $q.defer()
          User.getCurrentUser().then (user) ->
            User.me = user
            if User.me?
              deferred.resolve()
            else
              deferred.reject()

          deferred.promise
        ]
      # TODO verify why this way fails - the promise only triggers once - if it fails you cannot access tokens anymore
      # resolve:
      #   'authentication': 'ResolveUser'
    )

])

