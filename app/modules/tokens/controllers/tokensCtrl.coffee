tokensModule.controller 'tokensCtrl', [
  'Customer'
  '$scope'
  '$modal'
  'User'


  (Customer, $scope, $modal, User) ->

    $scope.customers = Customer.get()

    # DOM Variables
    $scope.User = User
    $scope.today = new Date().getTime()
    $scope.newCustomer = {}

    $scope.addCustomer = () ->
      $scope.newCustomer = Customer.add()

    $scope.remove = (customer) ->
      modalInstance = $modal.open(
        templateUrl: './commons/templates/modals/confirmation.html'
        controller: ($scope, $modalInstance) ->
          $scope.title = "Czy usunąć dostęp dla " + customer.name + " (" + customer.email + ")?"

          $scope.ok = () ->
            $modalInstance.close()

          $scope.cancel = () ->
            $modalInstance.dismiss('cancel')
      )

      modalInstance.result.then () ->
        customer.$remove()

]
