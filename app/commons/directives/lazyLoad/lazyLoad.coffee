
directiveModule
.directive('lazyLoad', ['$timeout', ($timeout) ->
  scope:
    cls: '@lazyLoad'
  link: (scope, elem, attr) ->
    $timeout ->
      $("img." + scope.cls).lazyload()
])
