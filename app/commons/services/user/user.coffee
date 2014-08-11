servicesModule
.service('User', [
  '$firebaseSimpleLogin'  
  '$location'
  '$firebase'

  ($firebaseSimpleLogin, $location, $firebase) ->

    ref = new Firebase("https://artdom-katalog.firebaseIO.com")
    auth = $firebaseSimpleLogin(ref)

    User =

      me: null

      login: (username, password, successLoginCallback) ->
        User.me = null
        auth.$login("password",
          email     : username
          password  : password
          rememberMe: true)
        .then (user) ->
          User.me = user
          console.log "logged in as ", user.uid
        , (error) ->
          console.error "login failed", error
        .then (successLoginCallback || angular.noop)


      logout: () ->
        auth.$logout()
        User.me = null
        $location.path '/login'

])
