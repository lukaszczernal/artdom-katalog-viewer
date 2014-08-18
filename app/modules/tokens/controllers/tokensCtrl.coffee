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
    $scope.newTokenValidTo = $scope.todayDate


    generateHash = () ->
      Math.random().toString(36).substr(2)

    $scope.add = () ->

      objectToSave =
        email: $scope.newTokenEmail
        validTo: $scope.newTokenValidTo

      ref.child(generateHash()).set(objectToSave)

    $scope.remove = (hash, data) ->

      modalInstance = $modal.open(
        templateUrl: './commons/templates/modals/confirmation.html'
        controller: ($scope, $modalInstance) ->
          $scope.title = "Czy usunąć dostęp dla " + data.email + "?"

          $scope.ok = () ->
            $modalInstance.close()

          $scope.cancel = () ->
            $modalInstance.dismiss('cancel')
      )

      modalInstance.result.then () ->
        ref.child(hash).remove()

]
