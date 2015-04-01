module.exports = class AMItem
  constructor: (@el, @startingPoint, @endingPoint)->
    @initBounds()
      .checkCallback()
      .bind()
    return @
 
  initBounds: ->
    if @el.getAttribute('data-startingPoint')
      @startingPoint = @el.getAttribute('data-startingPoint')
    if @el.getAttribute('data-endingPoint')
      @endingPoint = @el.getAttribute('data-endingPoint')
    return @

  checkPosition: (e)=>
    posTop = @offset().top
    if posTop < @getStartingPoint()
      if !@el.classList.contains('am-start')
        @el.classList.add('am-start')
        if @startingCallback
          fn = eval('('+@startingCallback+')')
          if typeof(fn) is 'function'
            fn(@el)
    else
      @el.classList.remove('am-start')
    if posTop < @getEndingPoint()
      if !@el.classList.contains('am-end')
        @el.classList.add('am-end')
    else
      @el.classList.remove('am-end')
    return @

  checkCallback: () ->
    if @el.getAttribute('data-startingCallback')
      @startingCallback = @el.getAttribute('data-startingCallback')
    if @el.getAttribute('data-endingCallback')
      @endingCallback = @el.getAttribute('data-endingCallback')
    return @

  getStartingPoint: ()->
    return document.body.scrollTop + (@startingPoint * window.innerHeight /100)

  getEndingPoint: ()->
    return document.body.scrollTop - @el.offsetHeight + (@endingPoint * window.innerHeight /100)

  offset: ()->
    rect = @el.getBoundingClientRect()
    return {
      top: rect.top + document.body.scrollTop
      left: rect.left + document.body.scrolLeft
    }

  bind: ->
    window.addEventListener('scroll', @checkPosition)
    return @