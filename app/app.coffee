artdomApp = angular.module('artdomApp', [
  'firebase'
  'ngRoute'
  'artdomApp.services'
  'artdomApp.directives'
  'artdomApp.home'
  'artdomApp.shop'
  'artdomApp.login'
  'artdomApp.tokens'
  'artdomApp.catalog'
  'ui.bootstrap'
])

# DEFAULT ROUTING
.config(['$locationProvider','$routeProvider', ($locationProvider, $routeProvider) ->

    $locationProvider.html5Mode(true)

    $routeProvider
    .when('/', redirectTo: '/wielki-kiermasz-nysa')
    .otherwise({redirectTo: '/'})

])

.run([
  '$rootScope'
  '$location'
  'User'

  ($rootScope, $location, User) ->

    # $rootScope.$on '$routeChangeStart', (evt, next, current) ->
    #   console.log 'route change start'
    #   if next.$$route.requireLogin && !User.me
    #     $location.path('/login')

    # $rootScope.$on '$routeChangeStart', (evt, next, current) ->
    #   console.log 'route change start'

    # $rootScope.$on '$routeChangeSuccess', (evt, next, current) ->
    #   console.log 'route change success'
    #   # if next.$$route.requireLogin && !User.me
    #   #   $location.path('/login')

    $rootScope.$on '$routeChangeError', (evt, next, current) ->
      if next.$$route.requireLogin && !User.me
        $location.path('/login')

])


