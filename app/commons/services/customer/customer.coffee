servicesModule
.service('Customer', [
  '$firebaseObject'
  '$firebaseArray'
  'DATABASE'

  ($firebaseObject, $firebaseArray, DATABASE) ->

    ref = new Firebase(DATABASE + '/hashes')
    cache = null

    generateHash = () ->
      Math.random().toString(36).substr(2)

    remove: (data) ->
      cache.$remove(data)

    save: (data) ->
      ref.child(generateHash()).set(data)

    update: (data) ->
      cache.$save(data)

    get: () ->
      cache || cache = $firebaseArray(ref)

])
