shopModule.controller('shopCtrl', [
  '$anchorScroll',
  '$location'
  '$scope'

  ($anchorScroll, $location, $scope) ->

    $scope.isActive = (route) ->
      $location.$$url.indexOf(route) >= 0

    $scope.scrollTo = (id)->
      $location.hash(id)
      $anchorScroll()
      false
])
