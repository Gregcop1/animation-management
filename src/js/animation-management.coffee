AMItem = require './AMItem.coffee'

window.AnimationManagement = class AnimationManagement
  targetClass: '.am-item' 
  startingPoint: 90
  endingPoint: 10

  items: []

  constructor: (options) ->   
    @targetClass = options.targetClass if options?.targetClass
    @startingPoint = options.startingPoint if options?.startingPoint
    @endingPoint = options.endingPoint if options?.endingPoint
    
    @initialize() 
    return @

  initialize: ->
    results = document.querySelectorAll(@targetClass)
    [].slice.call(results).forEach((el, i)=>
      @items.push( new AMItem(el, @startingPoint, @endingPoint) )
    )
    return @