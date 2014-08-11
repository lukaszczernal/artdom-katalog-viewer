loginModule.controller('loginCtrl', [
  '$location'
  '$scope'
  'User'

  ($location, $scope, User) ->

    $scope.username = "lukaszczernal@wp.pl"
    $scope.password = "3majsie"

    $scope.login = () ->
      User.login $scope.username, $scope.password, () -> 
        $location.path '/tokens'


])

