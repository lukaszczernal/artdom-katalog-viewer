catalogModule.controller 'catalogCtrl', [
  '$routeParams'
  '$firebase'
  '$location'
  '$filter'
  '$scope'
  '$http'
  '$q'

  ($routeParams, $firebase, $location, $filter, $scope, $http, $q) ->
    $scope.previewImgURL
    $scope.showPreview
    $scope.isPreview
    $scope.access
    $scope.pages
    
    # CHECK HASH IN FIREBASE
    # ref = new Firebase("https://artdom-katalog.firebaseIO.com/hashes/" + $routeParams.hash)
    # sync = $firebase(ref)
    # $scope.hash = sync.$asObject()
    # hashPromise = $scope.hash.$loaded()

    # # GET LIST OF PAGES
    pagesPromise = $http(
      method: "get"
      url: '/data/pages-array.json'
    )


    
    # $q.all([pagesPromise, hashPromise]).then (data) ->
    $q.all([pagesPromise]).then (data) ->
      $scope.pages = data[0].data
      $scope.access = true

      console.log $scope.pages
    , (err) ->
      $scope.access = false


    $scope.showPreview = (page) ->
      $scope.isPreview = true
      $scope.previewImgURL = "jpg/preview/" +  page.svg.file + ".jpg"

    $scope.hidePreview = () ->
      $scope.isPreview = false
      $scope.previewImgURL = ''      

]
