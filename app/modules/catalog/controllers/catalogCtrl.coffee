catalogModule.controller 'catalogCtrl', [
  '$firebaseObject'
  '$routeParams'
  '$location'
  'DATABASE'
  '$filter'
  '$scope'
  '$http'
  'User'
  '$q'

  ($firebaseObject, $routeParams, $location, DATABASE, $filter, $scope, $http, User, $q) ->
    $scope.previewImgURL
    $scope.showPreview
    $scope.isPreview
    $scope.access
    $scope.pages

    # CHECK HASH IN FIREBASE
    ref = new Firebase(DATABASE + "/hashes/" + $routeParams.hash)
    cache = $firebaseObject(ref)
    hashPromise = cache.$loaded()

    # # GET LIST OF PAGES
    pagesPromise = $http(
      method: "get"
      url: '/data/pages-array.json?' + (Math.floor(Math.random()*(99900-100+1)+100))
      cache: false
    )

    $q.all([pagesPromise, hashPromise]).then (data) ->
      $scope.pages = data[0].data
      hash = data[1]
      $scope.access = true

      User.getCurrentUser()
      .catch () ->
        addImpression(hash)

    , (err) ->
      $scope.access = false

    addImpression = (hash) ->
      count = hash.impressions || 0
      hash.impressions = ++count
      hash.$save()

    $scope.showPreview = (page) ->
      $scope.isPreview = true
      nocache = page.nocache || ''
      $scope.previewImgURL = "jpg/preview/" +  $filter('encodeFilename')(page.svg.file) + ".jpg" + nocache

    $scope.hidePreview = () ->
      $scope.isPreview = false
      $scope.previewImgURL = ''

]
