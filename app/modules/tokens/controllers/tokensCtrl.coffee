tokensModule.controller 'tokensCtrl', [
  '$firebase'
  '$location'
  '$filter'
  '$scope'
  '$modal'
  'User'


  ($firebase, $location, $filter, $scope, $modal ,User) ->

    # $scope.baseUrl = "http://" + $location.$$host + ":" + $location.$$port + "/katalog/"

    ref = new Firebase("https://artdom-katalog.firebaseIO.com/hashes")
    sync = $firebase(ref)

    syncObject = sync.$asObject()
    syncObject.$bindTo($scope, 'hashes')

    # DOM Variables
    $scope.User = User
    $scope.todayDate = $filter('date')(new Date(), 'yyyy-MM-dd')

    #TODO temp
    $scope.newTokenEmail = 'john@carmac.com'
    $scope.newTokenValidTo = '2014-08-15'


    generateHash = () ->
      Math.random().toString(36).substr(2)

    $scope.add = () ->

      objectToSave =
        email: $scope.newTokenEmail
        validTo: $scope.newTokenValidTo

      ref.child(generateHash()).set(objectToSave)

    $scope.remove = (hash) ->

      modalInstance = $modal.open(
        templateUrl: './commons/templates/modals/confirmation.html'

      )

      modalInstance.result.then () ->
        console.log 'modalInstance resolved'
        # ref.child(hash).remove()
        


]
