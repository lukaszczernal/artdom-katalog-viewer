catalogModule.controller 'catalogCtrl', [
  '$routeParams'
  '$firebase'
  '$location'
  '$filter'
  '$scope'

  ($routeParams, $firebase, $location, $filter, $scope) ->

    ref = new Firebase("https://artdom-katalog.firebaseIO.com/hashes/" + $routeParams.hash)
    sync = $firebase(ref)

    $scope.hash = sync.$asObject()

    $scope.access = null

    $scope.hash.$loaded().then (data) ->
      $scope.access = true
    , (err) ->
      $scope.access = false



]
