servicesModule
.factory('DataProvider', [
  '$firebaseArray'

  ($firebaseArray) ->

    class DataProvider

      @getSyncObject: () ->
        _provider = @
        $$added: (snap) ->
          return new _provider(snap)
        $$updated: (snapshot) ->
          return @$getRecord(snapshot.key).$refresh(snapshot)

      @get: (ref) ->
        @$list = new $firebaseArray.$extend(@getSyncObject())(ref)

      @add: (data, key) ->
        @ref.child(key).set(data)
        data

      constructor: (snapshot) ->
        @$id = snapshot.key
        @$refresh(snapshot)

      $refresh: (snapshot) ->
        oldData = angular.copy(@)
        angular.extend(@, snapshot.val())
        @$transformResponse()
        !angular.equals(@, oldData)

      $save: (data) ->
        angular.extend(@, data)
        @$transformRequest()
        @.__proto__.constructor.$list.$save(@)

      $remove: () ->
        @.__proto__.constructor.$list.$remove(@)

])
