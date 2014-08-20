servicesModule
.service('User', [
  '$firebaseSimpleLogin'
  '$location'
  '$firebase'

  ($firebaseSimpleLogin, $location, $firebase) ->

    ref = new Firebase("https://artdom-katalog.firebaseIO.com")

    User =
      auth: $firebaseSimpleLogin(ref)

      me: null

      login: (username, password, successLoginCallback) ->
        User.me = null
        @auth.$login("password",
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
        @auth.$logout()
        User.me = null
        $location.path '/login'

      getCurrentUser: () ->
        if !User.me
          @auth.$getCurrentUser().then (user) ->
            User.me = user
        else
          'then': (callback) ->
            callback(User.me)
])

#TODO - check tokensModule.coffee for more info
# .service('ResolveUser', [
#   '$location'
#   'User'
#   '$q'

#   ($location, User, $q) ->
#     deferred = $q.defer()
#     User.auth.$getCurrentUser().then (user) ->
#       User.me = user
#       if User.me?
#         console.log 'deferred resolve'
#         deferred.resolve()
#       else
#         console.log 'deferred reject'
#         deferred.reject()

#     deferred.promise

# ])
