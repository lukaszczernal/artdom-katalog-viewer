loginModule.controller('loginCtrl', [
  '$location'
  '$scope'
  'User'

  ($location, $scope, User) ->

    $scope.login = () ->
      User.login($scope.username, $scope.password).then () ->
        window.location.href = '/tokens' # for some reason $location does not trigger digest


])
