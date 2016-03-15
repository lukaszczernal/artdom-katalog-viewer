servicesModule
.service('User', [
  '$location'
  'DATABASE'
  '$q'

  ($location, DATABASE, $q) ->

    ref = new Firebase(DATABASE)

    User =
      me: null

      login: (username, password) ->
        User.me = null

        credentials =
          email    : username
          password : password

        callback = (error, authData) ->
          if (error)
            console.log("Login Failed!", error)
          else
            console.log("Authenticated successfully with payload:", authData)
            User.me = authData

        ref.authWithPassword(credentials, callback)

      logout: () ->
        ref.unauth()
        User.me = null
        $location.path '/login'

      getCurrentUser: () ->
        def = $q.defer()
        User.me = ref.getAuth()
        if User.me? then def.resolve(User.me) else def.reject()
        def.promise

])
