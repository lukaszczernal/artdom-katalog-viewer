loginModule.controller('loginCtrl', [
  '$location'
  '$scope'
  'User'

  ($location, $scope, User) ->

    $scope.login = () ->
      User.login $scope.username, $scope.password, () ->
        $location.path '/tokens'


])

