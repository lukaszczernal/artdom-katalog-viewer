artdomApp = angular.module('artdomApp', [
  'ngRoute',
  'artdomApp.directives',
  'artdomApp.home',
  'artdomApp.shop'
])

# DEFAULT ROUTING
.config(['$routeProvider', ($routeProvider) ->

   $routeProvider
   .when('/', redirectTo: '/wielki-kiermasz-nysa')
   .otherwise('/')

])


