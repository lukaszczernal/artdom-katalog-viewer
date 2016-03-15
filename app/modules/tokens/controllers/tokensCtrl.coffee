tokensModule.controller 'tokensCtrl', [
  'Customer'
  '$filter'
  '$scope'
  '$modal'
  'User'


  (Customer, $filter, $scope, $modal, User) ->

    $scope.customers = Customer.get()

    # DOM Variables
    $scope.User = User
    $scope.today = new Date().getTime()
    $scope.todayDate = $filter('date')($scope.today, 'yyyy-MM-dd')
    $scope.newTokenValidTo = new Date($scope.today + (1000*60*60*24*3))

    $scope.add = () ->
      data =
        name: $scope.newTokenName
        email: $scope.newTokenEmail
        validTo: $scope.newTokenValidTo.getTime()

      Customer.save(data)

    $scope.remove = (customer) ->

      modalInstance = $modal.open(
        templateUrl: './commons/templates/modals/confirmation.html'
        controller: ($scope, $modalInstance) ->
          $scope.title = "Czy usunąć dostęp dla " + customer.email + "?"

          $scope.ok = () ->
            $modalInstance.close()

          $scope.cancel = () ->
            $modalInstance.dismiss('cancel')
      )

      modalInstance.result.then () ->
        Customer.remove(customer)

    $scope.prolong = (customer) ->
      customer.validTo = new Date().getTime() + (1000*60*60*24*3)
      Customer.update(customer)

]
