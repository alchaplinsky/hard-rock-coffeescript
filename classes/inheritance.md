## Inheritance & Super

It wouldn't be a proper class implementation without some form of inheritance, and CoffeeScript doesn't disappoint. You can inherit from another class by using the extends keyword.

*CoffeeScript*
``` coffeescript
class Instrument
  constructor: (@type)->

  sound: ->
    console.log("#{@type} sound")

class Guitar extends Instrument

  constructor: ->
    super("Guitar")

guitar = new Guitar()  
guitar.sound() # Guitar sound
```
*JavaScript*
``` javascript
var Guitar, Instrument, guitar,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };
Instrument = (function() {
  function Instrument(type) {
    this.type = type;
  }
  Instrument.prototype.sound = function() {
    return console.log("" + this.type + " sound");
  };
  return Instrument;
})();

Guitar = (function(_super) {
  __extends(Guitar, _super);
  function Guitar() {
    Guitar.__super__.constructor.call(this, "Guitar");
  }
  return Guitar;
})(Instrument);

guitar = new Guitar();
guitar.sound(); // Guitar sound
```

This class extends Guitar, which means that it has all the characteristics of the parent class. The constructor and profit functions are exactly the same, the only difference is that you make a call to Fender instead of Guitar when constructing an instance.

You'll notice that in the example above, we're using the ```super()``` keyword. Behind the scenes, this is translated into a function call on the class' parent prototype, invoked in the current context. In this case, it'll be Parrot.__super__.constructor.call(this, "Parrot");. In practice, this will have exactly the same effect as invoking super in Ruby or Python, invoking the overridden inherited function.

Unless you override the constructor, by default CoffeeScript will invoke the parent's constructor when instances are created.

CoffeeScript uses prototypal inheritance to automatically inherit all of a class's instance properties. This ensures that classes are dynamic; even if you add properties to a parent class after a child has been created, the property will still be propagated to all of its inherited children.
*CoffeeScript*
``` coffeescript
class Instrument
  constructor: (@type)->

class Guitar extends Instrument

Instrument::acoustic = true

guitar = new Guitar()  
console.log "Acoustic guitar" if guitar.acoustic
```
*JavaScript*
``` javascript
var Guitar, Instrument, guitar,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };
Instrument = (function() {
  function Instrument(type) {
    this.type = type;
  }
  return Instrument;
})();

Guitar = (function(_super) {
  __extends(Guitar, _super);
  function Guitar() {
    return Guitar.__super__.constructor.apply(this, arguments);
  }
  return Guitar;
})(Instrument);
Instrument.prototype.acoustic = true;

guitar = new Guitar();
if (guitar.acoustic) {
  console.log("Acoustic guitar");
}
```
