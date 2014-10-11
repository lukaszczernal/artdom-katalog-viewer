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
    $scope.today = new Date().getTime()
    $scope.todayDate = $filter('date')($scope.today, 'yyyy-MM-dd')
    $scope.newTokenValidTo = $filter('date')($scope.today + (1000*60*60*24*3), 'yyyy-MM-dd')  # INITIAL VALUE FOR VALID TO FIELD


    generateHash = () ->
      Math.random().toString(36).substr(2)

    $scope.add = () ->
      date  = $scope.newTokenValidTo # NEED THIS FOR COVNERTION FROM YYYY-MM-DD TO TIMESTAMP
      year  = date[0..3]
      month = date[5..6]
      day   = date[8..9]

      objectToSave =
        email: $scope.newTokenEmail
        validTo: new Date(year, month-1, day).getTime()

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

    $scope.prolong = (hash, data) ->
      $scope.hashes[hash].validTo = new Date().getTime() + (1000*60*60*24*3)

]
