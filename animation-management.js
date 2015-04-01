;(function(e,t,n){function i(n,s){if(!t[n]){if(!e[n]){var o=typeof require=="function"&&require;if(!s&&o)return o(n,!0);if(r)return r(n,!0);throw new Error("Cannot find module '"+n+"'")}var u=t[n]={exports:{}};e[n][0](function(t){var r=e[n][1][t];return i(r?r:t)},u,u.exports)}return t[n].exports}var r=typeof require=="function"&&require;for(var s=0;s<n.length;s++)i(n[s]);return i})({1:[function(require,module,exports){
(function() {
  var AMItem, AnimationManagement;

  AMItem = require('./AMItem.coffee');

  window.AnimationManagement = AnimationManagement = (function() {
    AnimationManagement.prototype.targetClass = '.am-item';

    AnimationManagement.prototype.startingPoint = 90;

    AnimationManagement.prototype.endingPoint = 10;

    AnimationManagement.prototype.items = [];

    function AnimationManagement(options) {
      if (options != null ? options.targetClass : void 0) {
        this.targetClass = options.targetClass;
      }
      if (options != null ? options.startingPoint : void 0) {
        this.startingPoint = options.startingPoint;
      }
      if (options != null ? options.endingPoint : void 0) {
        this.endingPoint = options.endingPoint;
      }
      this.initialize();
      return this;
    }

    AnimationManagement.prototype.initialize = function() {
      var results,
        _this = this;
      results = document.querySelectorAll(this.targetClass);
      [].slice.call(results).forEach(function(el, i) {
        return _this.items.push(new AMItem(el, _this.startingPoint, _this.endingPoint));
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
    function AMItem(el, startingPoint, endingPoint) {
      this.el = el;
      this.startingPoint = startingPoint;
      this.endingPoint = endingPoint;
      this.checkPosition = __bind(this.checkPosition, this);
      this.initBounds().checkCallback().bind();
      return this;
    }

    AMItem.prototype.initBounds = function() {
      if (this.el.getAttribute('data-startingPoint')) {
        this.startingPoint = this.el.getAttribute('data-startingPoint');
      }
      if (this.el.getAttribute('data-endingPoint')) {
        this.endingPoint = this.el.getAttribute('data-endingPoint');
      }
      return this;
    };

    AMItem.prototype.checkPosition = function(e) {
      var fn, posTop;
      posTop = this.offset().top;
      if (posTop < this.getStartingPoint()) {
        if (!this.el.classList.contains('am-start')) {
          this.el.classList.add('am-start');
          if (this.startingCallback) {
            fn = eval('(' + this.startingCallback + ')');
            if (typeof fn === 'function') {
              fn(this.el);
            }
          }
        }
      } else {
        this.el.classList.remove('am-start');
      }
      if (posTop < this.getEndingPoint()) {
        if (!this.el.classList.contains('am-end')) {
          this.el.classList.add('am-end');
        }
      } else {
        this.el.classList.remove('am-end');
      }
      return this;
    };

    AMItem.prototype.checkCallback = function() {
      if (this.el.getAttribute('data-startingCallback')) {
        this.startingCallback = this.el.getAttribute('data-startingCallback');
      }
      if (this.el.getAttribute('data-endingCallback')) {
        this.endingCallback = this.el.getAttribute('data-endingCallback');
      }
      return this;
    };

    AMItem.prototype.getStartingPoint = function() {
      return document.body.scrollTop + (this.startingPoint * window.innerHeight / 100);
    };

    AMItem.prototype.getEndingPoint = function() {
      return document.body.scrollTop - this.el.offsetHeight + (this.endingPoint * window.innerHeight / 100);
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