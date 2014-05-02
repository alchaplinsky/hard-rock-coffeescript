### Instance properties

Adding additional instance properties to a class is very straightforward, it's exactly the syntax as adding properties onto an object. Just make sure properties are indented correctly inside the class body.

*CoffeeScript*
``` coffeescript
class Band
  members: 4

  play: (song) ->

band = new Band()  
band.play('Brick in the wall')
```
*JavaScript*
``` javascript
var Band, band;
Band = (function() {
  function Band() {}
  Band.prototype.members = 4;
  Band.prototype.play = function(song) {
  };
  return Band;
})();
band = new Band();
band.play('Brick in the wall');
```

Context changes are rife within JavaScript, and earlier in the Syntax chapter we talked about how CoffeeScript can lock the value of this to a particular context using a fat arrow function: =>. This ensures that whatever context a function is called under, it'll always execute inside the context it was created in. CoffeeScript has extended support for fat arrows to classes, so by using a fat arrow for an instance method you'll ensure that it's invoked in the correct context, and that this is always equal to the current instance.

*CoffeeScript*
``` coffeescript
class Band
  members: 4

  play: (song) =>
    console.log "Band is playing #{song}"

band = new Band()  
$('#play-button').click(band.play)
```
*JavaScript*
``` javascript
var Band, band,
  __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; Â
Band = (function() {
  function Band() {
    this.play = __bind(this.play, this);
  }
  Band.prototype.members = 4;
  Band.prototype.play = function(song) {
    return console.log("Band is playing " + song);
  };
  return Band;
})();

band = new Band();
$('#play-button').click(band.play);
```


As demonstrated in the example above, this is especially useful in event callbacks. Normally the sell() function would be invoked in the context of the #sell element. However, by using fat arrows for sell(), we're ensuring the correct context is being maintained, and that this.price equals 5.

### Static properties

How about defining class (i.e. static) properties? Well, it turns out that inside a class definition, this refers to the class object. In other words you can set class properties by setting them directly on this.

*CoffeeScript*
``` coffeescript
class Band
  this.play = (song) ->

  Band.play('Brick in the wall')
```
*JavaScript
``` javascript
var Band;
Band = (function() {
  function Band() {}
  Band.play = function() {};
  Band.play('Brick in the wall');
  return Band;
})();
```
In fact, as you may remember, CoffeeScript aliases this to @, which lets you write static properties even more succinctly:

*CoffeeScript*
``` coffeescript
class Band
  @play = (song) ->

  Band.play('Brick in the wall')
```
