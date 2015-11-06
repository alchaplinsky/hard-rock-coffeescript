## Classes
JavaScript doesn’t have a traditional class system. Instead, it has prototypes. Prototypes can be extremely versatile and powerful, but they’re confusing to novices. Hence, CoffeeScript has created a traditional class system.

Instead of repetitively attaching functions to a prototype, CoffeeScript provides a basic class structure that allows you to name your class, set the superclass, assign prototypal properties, and define the constructor, in a single assignable expression.

Behind the scenes, CoffeeScript is using JavaScript's native prototype to create classes; adding a bit of syntactic sugar for static property inheritance and context persistence. As a developer all that's exposed to you is the class keyword.

*CoffeeScript*
``` coffeescript
class Guitar
```
*JavaScript*
``` javascript
var Guitar;
Guitar = (function() {
  function Guitar() {}
  return Guitar;
})();
```
In the example above, Guitar is the name of the class, and also the name of the returned variable that you can use to
create instances. Behind the scenes CoffeeScript is using constructor functions, which means you can instantiate classes
using the new operator.

*CoffeeScript*
``` coffeescript
gibson = new Guitar()
```
*JavaScript*
``` javascript
var gibson;
gibson = new Guitar();
```

Defining constructors, functions that get invoked on instantiation, is simple, just use a function named ```constructor```.
This works pretty similar to Python's ```__init__``` or Ruby's ```initialize``` methods . It prepares the new object for use,
accepting arguments that the constructor uses to set required instance variables.

*CoffeeScript*
``` coffeescript
class Guitar
  constructor: (type) ->
    @type = type
```
*JavaScript*
``` coffeescript
var Guitar;
Guitar = (function() {
  function Guitar(type) {
    this.type = type;
  }
  return Guitar;
})();
```

As you can see, constructor accepts ```type``` as an argument and sets it as an instance variable. CoffeeScript provides
a shorthand for the common pattern of setting instance properties. By prefixing argument's with ```@```, CoffeeScript will
automatically set the arguments as instance properties in the constructor. Indeed, this shorthand will also work for normal
functions outside classes. The example below is equivalent to the last example, where we set the instance properties manually.

*CoffeeScript*
``` coffeescript
class Guitar
  constructor: (@type) ->
```
*JavaScript*
``` javascript
var Guitar;
Guitar = (function() {
  function Guitar(type) {
    this.type = type;
  }
  return Guitar;
})();
```
So constructor is called when we use ```new``` keyword along with class name. Any arguments passed to a class on instantiation are proxied to the constructor function.

*CoffeeScript*
``` coffeescript
gibson = new Guitar("Les Paul")
alert "Guitar is a #{gibson.type}"
```
*JavaScript*
``` javascript
var gibson;
gibson = new Guitar("Les Paul");
alert("Guitar is a " + gibson.type);
```
