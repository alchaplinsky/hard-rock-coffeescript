## Mixins and Extending classes

Mixins are not something supported natively by CoffeeScript, for the good reason that they can be trivially implemented yourself. For example, here are two functions, ```extend()``` and ```include()``` that'll add class and instance properties respectively to a class.

*CoffeeScript*
``` coffeescript
extend = (obj, mixin) ->
  obj[name] = method for name, method of mixin
  obj

include = (klass, mixin) ->
  extend klass.prototype, mixin

# Usage
include Guitar,
  strings: true
guitar = new Guitar()
guitar.strings
```
*JavaScript*
``` js
var extend, guitar, include;
extend = function(obj, mixin) {
  var method, name;
  for (name in mixin) {
    method = mixin[name];
    obj[name] = method;
  }
  return obj;
};
include = function(klass, mixin) {
  return extend(klass.prototype, mixin);
};
include(Guitar, {
  strings: true
});
guitar = new Guitar();
guitar.strings;
```

Mixins are a great pattern for sharing common logic between modules when inheritance is not suited. The advantage of mixins, is that you can include multiple ones, compared to inheritance where only one class can be inherited from.

## Extending classes

Mixins are pretty neat, but they're not very object orientated. Instead, let's integrate mixins into CoffeeScript's classes. We're going to define a class called ```Module``` that we can inherit from for mixin support. Module will have two static functions, ```@extend()``` and ```@include()``` which we can use for extending the class with static and instance properties respectively.

*CoffeeScript*
``` coffeescript
moduleKeywords = ['extended', 'included']

class Module
  @extend: (obj) ->
    for key, value of obj when key not in moduleKeywords
      @[key] = value
    obj.extended?.apply(@)
    @

  @include: (obj) ->
    for key, value of obj when key not in moduleKeywords
      @::[key] = value
    obj.included?.apply(@)
    @
```
*JavaScript*
``` javascript
var Module, moduleKeywords,
  __indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };
moduleKeywords = ['extended', 'included'];
Module = (function() {
  function Module() {}
  Module.extend = function(obj) {
    var key, value, _ref;
    for (key in obj) {
      value = obj[key];
      if (__indexOf.call(moduleKeywords, key) < 0) {
        this[key] = value;
      }
    }
    if ((_ref = obj.extended) != null) {
      _ref.apply(this);
    }
    return this;
  };

  Module.include = function(obj) {
    var key, value, _ref;
    for (key in obj) {
      value = obj[key];
      if (__indexOf.call(moduleKeywords, key) < 0) {
        this.prototype[key] = value;
      }
    }
    if ((_ref = obj.included) != null) {
      _ref.apply(this);
    }
    return this;
  };
  return Module;
})();
```

The little dance around the moduleKeywords variable is to ensure we have callback support when mixins extend a class. Let's take a look at our Module class in action:

*CoffeeSscript*
``` coffeescript
classProperties =
  tuning: ->

instanceProperties =
  makeSound: ->

class Guitar extends Module
  @extend classProperties
  @include instanceProperties

Guitar.tuning()

guitar = new Guitar()
guitar.makeSound()
```
*JavaScript*
``` javascript
var Guitar, classProperties, guitar, instanceProperties,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };
classProperties = {
  tuning: function() {}
};
instanceProperties = {
  makeSound: function() {}
};
Guitar = (function(_super) {
  __extends(Guitar, _super);
  function Guitar() {
    return Guitar.__super__.constructor.apply(this, arguments);
  }
  Guitar.extend(classProperties);
  Guitar.include(instanceProperties);
  return Guitar;
})(Module);

Guitar.tuning();
guitar = new Guitar();
guitar.makeSound();
```

So above we've added static property ```tuning()``` to the ```Guitar``` class, as well as an instance
property, ```makeSound()```. Since we've got callbacks whenever modules are extended, we can shortcut the process of applying
both static and instance properties:

*CoffeeScript*
``` coffeescript
SOUND =
  tuning: ->
  extended: ->
    @include
      makeSound: ->

class Guitar extends Module
  @extend SOUND
```
*JavaScript*
``` javascript
var Guitar, SOUND,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

SOUND = {
  tuning: function() {},
  extended: function() {
    return this.include({
      makeSound: function() {}
    });
  }
};

Guitar = (function(_super) {
  __extends(Guitar, _super);
  function Guitar() {
    return Guitar.__super__.constructor.apply(this, arguments);
  }
  Guitar.extend(SOUND);
  return Guitar;
})(Module);
```
