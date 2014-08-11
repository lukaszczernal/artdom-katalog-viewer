tokensModule.controller 'tokensCtrl', [
  '$scope'
  'User'


  ($scope, User) ->

    $scope.User = User

    ref = new Firebase("https://artdom-katalog.firebaseIO.com/hash")

    ref.on 'value',  (snapshot) ->
      $scope.hashes = snapshot.val()
      $scope.$apply()
    , (errorObject) ->
      console.log('The read failed: ' + errorObject.code)



]
