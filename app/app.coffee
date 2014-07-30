artdomApp = angular.module('artdomApp', [
  'ngRoute',
  'firebase'
  'artdomApp.directives',
  'artdomApp.home',
  'artdomApp.shop'
  'artdomApp.login'
])

# DEFAULT ROUTING
.config(['$locationProvider','$routeProvider', ($locationProvider, $routeProvider) ->

    $locationProvider.html5Mode(true)

    $routeProvider
    .when('/', redirectTo: '/wielki-kiermasz-nysa')
    .otherwise('/')

])


