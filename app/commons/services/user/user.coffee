servicesModule
.service('User', ['$location', ($location) ->

  ref = new Firebase("https://artdom-katalog.firebaseIO.com")

  auth = new FirebaseSimpleLogin ref, (error, user) ->

    if (error)
      console.log(error)
    else if (user)
      console.log("User:", user)
      $location.path '/tokens'
      User.me = user
      User.successLoginCallback()

    else
      console.log 'user is logged out'


  User =

    me: null
    successLoginCallback: angular.noop

    login: (username, password, successLoginCallback) ->
      @successLoginCallback = successLoginCallback

      auth.login "password",
        email     : username
        password  : password
        rememberMe: true

    logout: () ->
      auth.logout()
      User.me = null
      $location.path '/login'

    # loginCallback: (err, user) ->
    #   @me = user

    #   if (err)
    #     console.log(err)
    #   else if (user)
    #     @isLoggedin = true
    #     $location.path '/tokeny'
    #     console.log("User ID: " + user.uid + ", Provider: " + user.provider)
    #   else
    #     console.log 'user is logged out'

    #   $scope.$apply()

    #   @successLoginCallback()
    #   @successLoginCallback = angular.noop

])
