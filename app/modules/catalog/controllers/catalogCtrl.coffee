catalogModule.controller 'catalogCtrl', [
  '$routeParams'
  '$firebase'
  '$location'
  '$filter'
  '$scope'

  ($routeParams, $firebase, $location, $filter, $scope) ->

    # ref = new Firebase("https://artdom-katalog.firebaseIO.com/hashes/" + $routeParams.hash)
    # sync = $firebase(ref)

    # $scope.hash = sync.$asObject()

    # $scope.access = null

    # $scope.hash.$loaded().then (data) ->
    #   $scope.access = true
    # , (err) ->
    #   $scope.access = false

    client = new Dropbox.Client({key: 'e0ipo34kgsqwzg6'})

    # // Try to finish OAuth authorization.
    client.authenticate {interactive: false}, (error, customer) ->
      if (error)
        alert('Authentication error: ' + error)
      else
        console.log 'todo bien'

        # if (client.isAuthenticated())
        #     console.log 'client.isAuthenticated'

    # console.log 'client.isAuthenticated()', client.isAuthenticated()

    # datastoreManager = client.getDatastoreManager()

    # console.log 'datastoreManager', datastoreManager
    # datastoreManager.listDatastores()

    # client.readFile("express-katalog/public/jpg/1-2 MATY.svg.jpg", {}, readComplete)

]
