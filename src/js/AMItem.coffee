module.exports = class AMItem
  constructor: (@el)->
    @initialize()
      .bind()
    return @
 
  initialize: ->
    return @

  checkPosition: (e)=>
    posTop = @offset().top
    if posTop < document.body.scrollTop
      @el.classList.add('am-start')
    else
      @el.classList.remove('am-start')

    return @

  offset: ()->
    rect = @el.getBoundingClientRect()
    return {
      top: rect.top + document.body.scrollTop
      left: rect.left + document.body.scrolLeft
    }

  bind: ->
    window.addEventListener('scroll', @checkPosition)
    return @