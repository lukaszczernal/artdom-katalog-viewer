catalogModule.controller 'catalogCtrl', [
  '$routeParams'
  '$firebase'
  '$location'
  '$filter'
  '$scope'
  '$http'
  'User'
  '$q'

  ($routeParams, $firebase, $location, $filter, $scope, $http, User, $q) ->
    $scope.previewImgURL
    $scope.showPreview
    $scope.isPreview
    $scope.access
    $scope.pages

    # CHECK HASH IN FIREBASE
    ref = new Firebase("https://artdom-katalog.firebaseIO.com/hashes/" + $routeParams.hash)
    sync = $firebase(ref)
    hashPromise = sync.$asObject().$loaded()

    # # GET LIST OF PAGES
    pagesPromise = $http(
      method: "get"
      url: '/data/pages-array.json'
    )

    $q.all([pagesPromise, hashPromise]).then (data) ->
      $scope.pages = data[0].data
      hash = data[1]
      $scope.access = true

      User.getCurrentUser().then () ->
        addImpression(hash) if not User.me?

    , (err) ->
      $scope.access = false

    addImpression = (hash) ->
      count = hash.impressions || 0
      hash.impressions = ++count
      hash.$save()

    $scope.showPreview = (page) ->
      $scope.isPreview = true
      $scope.previewImgURL = "jpg/preview/" +  page.svg.file + ".jpg"

    $scope.hidePreview = () ->
      $scope.isPreview = false
      $scope.previewImgURL = ''

]
