artdomApp = angular.module('artdomApp', [
  'firebase'
  'ngRoute'
  'artdomApp.services'
  'artdomApp.filters'
  'artdomApp.directives'
  'artdomApp.home'
  'artdomApp.shop'
  'artdomApp.wholesale'
  'artdomApp.login'
  'artdomApp.tokens'
  'artdomApp.catalog'
  'ui.bootstrap'
])

# DEFAULT ROUTING
.config(['$locationProvider','$routeProvider', ($locationProvider, $routeProvider) ->

    $locationProvider.html5Mode(true)

    $routeProvider
    .when('/', redirectTo: '/hurtownia')
    .otherwise({redirectTo: '/'})

])

.run([
  '$rootScope'
  '$location'
  'User'
  '$route'

  ($rootScope, $location, User, $route) ->

    # ROUTING DEPENDS ON DOMAIN
    domainRoutes = 
      'localhost': '/sklep-nysa'
      'artdom.opole.pl': '/hurtownia'
      'wielkikiermasz.pl': '/sklep-nysa'

    $route.routes['/'].redirectTo = domainRoutes[$location.host()]


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


