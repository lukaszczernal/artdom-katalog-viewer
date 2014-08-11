tokensModule.controller 'tokensCtrl', [
  '$firebase'
  '$location'
  '$filter'
  '$scope'
  'User'


  ($firebase, $location, $filter, $scope, User) ->

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


    $scope.add = () ->
      #TODO generate hash
      generatedHash = 'abudabi'

      objectToSave =  
        email: $scope.newTokenEmail
        validTo: $scope.newTokenValidTo

      ref.child(generatedHash).set(objectToSave)

]
