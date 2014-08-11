loginModule.controller('loginCtrl', [
  '$location'
  '$scope'
  'User'

  ($location, $scope, User) ->

    $scope.loggedin = false

    # ref = new Firebase("https://artdom-katalog.firebaseIO.com")

    # auth = new FirebaseSimpleLogin ref, (error, user) =>
    #   $scope.user = null

    #   if (error)
    #     console.log(error)
    #   else if (user)
    #     $scope.user = user
    #     $location.path '/tokeny'
    #     console.log("User ID: " + user.uid + ", Provider: " + user.provider)
    #   else
    #     console.log 'user is logged out'

    #   $scope.$apply()


    # authRef = new Firebase("https://artdom-katalog.firebaseIO.com/.info/authenticated")
    # authRef.on "value", (snap) ->
    #   $scope.loggedin = (snap.val() is true)

    $scope.login = () ->
      # console.log 'sdf'
      # User.login($scope.username, $scope.password)
      User.login($scope.username, $scope.password, ()=> $scope.$apply())
      # auth.login "password",
      #   email     : $scope.username
      #   password  : $scope.password
      #   rememberMe: true

    # $scope.logout = () ->
    #   User.logout()

])

