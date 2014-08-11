artdomApp = angular.module('artdomApp', [
  'firebase'
  'ngRoute'
  'artdomApp.services'
  'artdomApp.directives'
  'artdomApp.home'
  'artdomApp.shop'
  'artdomApp.login'
  'artdomApp.tokens'
])

# DEFAULT ROUTING
.config(['$locationProvider','$routeProvider', ($locationProvider, $routeProvider) ->

    $locationProvider.html5Mode(true)

    $routeProvider
    .when('/', redirectTo: '/wielki-kiermasz-nysa')
    .otherwise('/')

])


