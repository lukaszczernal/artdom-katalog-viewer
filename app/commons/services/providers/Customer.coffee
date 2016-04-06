servicesModule
.service('Customer', [
  '$firebaseArray'
  'DataProvider'
  'DATABASE'

  ($firebaseArray, DataProvider, DATABASE) ->

    class Customer extends DataProvider

      @ref: new Firebase(DATABASE + '/hashes')

      @get: () ->
        ref = @ref.orderByChild('createDate')
        super(ref)

      @generateHash = () ->
        Math.random().toString(36).substr(2)

      @add: () ->
        now = new Date().getTime()
        data =
          name: ''
          email: ''
          validTo: new Date(now + (1000*60*60*24*3)).getTime() # today + 3 days
          createDate: now
        super(data, @generateHash())

      $transformResponse: () =>
        @$validToDate = new Date(@validTo)

      $transformRequest: () =>
        @validTo = @validTo.getTime() if @validTo instanceof Date

])
