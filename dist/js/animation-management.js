;(function(e,t,n){function i(n,s){if(!t[n]){if(!e[n]){var o=typeof require=="function"&&require;if(!s&&o)return o(n,!0);if(r)return r(n,!0);throw new Error("Cannot find module '"+n+"'")}var u=t[n]={exports:{}};e[n][0](function(t){var r=e[n][1][t];return i(r?r:t)},u,u.exports)}return t[n].exports}var r=typeof require=="function"&&require;for(var s=0;s<n.length;s++)i(n[s]);return i})({1:[function(require,module,exports){
(function() {
  var AMItem, AnimationManagement;

  AMItem = require('./AMItem.coffee');

  window.AnimationManagement = AnimationManagement = (function() {
    AnimationManagement.prototype.targetClass = '.am-item';

    AnimationManagement.prototype.items = [];

    function AnimationManagement(options) {
      if (options != null ? options.targetClass : void 0) {
        this.targetClass = options.targetClass;
      }
      this.initialize();
      return this;
    }

    AnimationManagement.prototype.initialize = function() {
      var results,
        _this = this;
      results = document.querySelectorAll(this.targetClass);
      [].slice.call(results).forEach(function(el, i) {
        return _this.items.push(new AMItem(el));
      });
      return this;
    };

    return AnimationManagement;

  })();

}).call(this);


},{"./AMItem.coffee":2}],2:[function(require,module,exports){
(function() {
  var AMItem,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  module.exports = AMItem = (function() {
    function AMItem(el) {
      this.el = el;
      this.checkPosition = __bind(this.checkPosition, this);
      this.initialize().bind();
      return this;
    }

    AMItem.prototype.initialize = function() {
      return this;
    };

    AMItem.prototype.checkPosition = function(e) {
      var posTop;
      posTop = this.offset().top;
      if (posTop < document.body.scrollTop) {
        this.el.classList.add('am-start');
      } else {
        this.el.classList.remove('am-start');
      }
      return this;
    };

    AMItem.prototype.offset = function() {
      var rect;
      rect = this.el.getBoundingClientRect();
      return {
        top: rect.top + document.body.scrollTop,
        left: rect.left + document.body.scrolLeft
      };
    };

    AMItem.prototype.bind = function() {
      window.addEventListener('scroll', this.checkPosition);
      return this;
    };

    return AMItem;

  })();

}).call(this);


},{}]},{},[1])
;