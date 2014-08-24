filtersModule
.filter('encodeFilename', ()->
  (filename) ->
    filename.split(' ').join('_')
)
