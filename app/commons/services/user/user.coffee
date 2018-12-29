servicesModule
.factory('User', [
  '$location'
  'Auth'
  ($location, Auth) ->
    new User($location, Auth)
])

class User
  me: null

  constructor: (@$location, @Auth) -> { }

  login: (username, password) ->
    @Auth.$signInWithEmailAndPassword(username, password)
      .then((authData) ->
        User.me = authData
      )
      .catch((error) -> console.log("Login Failed!", error))

  logout: () ->
    @Auth.$signOut()
    User.me = null
    @$location.path '/login'

  getCurrentUser: () ->
    @Auth.$requireSignIn()
