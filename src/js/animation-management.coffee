AMItem = require './AMItem.coffee'

window.AnimationManagement = class AnimationManagement
  targetClass: '.am-item' 
  items: []

  constructor: (options) ->   
    @targetClass = options.targetClass if options?.targetClass
    
    @initialize() 
    return @

  initialize: ->
    results = document.querySelectorAll(@targetClass)
    [].slice.call(results).forEach((el, i)=>
      @items.push( new AMItem(el) )
    )
    return @