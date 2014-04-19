## Functions

CoffeeScript removes the rather verbose function statement, and replaces it with a thin arrow: ```->```.
Functions can be one liners or indented on multiple lines. The last expression in the function is implicitly returned.
In other words, you don't need to use the return statement unless you want to return earlier inside the function.

With that in mind, let's take a look at an example:

*CoffeScript*:
``` coffeescript
func = -> "bar"
```

*JavaScript*:
``` javascript
var func;
func = function() {
  return "bar";
};
```
You can see in the resultant compilation, the -> is turned into a function statement, and the "bar" string is automatically returned.

As mentioned earlier, there's no reason why we can't use multiple lines, as long as we indent the function body properly.

*CoffeScript*:
``` coffeescript
func = ->
  # An extra line
  "bar"
```
*JavaScript*:
``` javascript
var func;
func = function() {
  return "bar";
};
```
## Function arguments

What about passing arguments to a function? Well, CoffeeScript allows you do that by specifying arguments
in parentheses before the arrow.

*CoffeScript*:
``` coffeescript
times = (a, b) -> a * b
```

*JavaScript*:
``` javascript
var times;
times = function(a, b) {
  return a * b;
};
```

CoffeeScript supports default arguments too, for example:

*CoffeScript*:
``` coffeescript
times = (a = 1, b = 2) -> a * b
```

*JavaScript*:
``` javascript
var times;
times = function(a, b) {
  if (a == null) {
    a = 1;
  }
  if (b == null) {
    b = 2;
  }
  return a * b;
};
```

## Function invocation

Functions can be invoked exactly as in JavaScript, with parens (), apply() or call(). However, like Ruby, CoffeeScript will automatically call functions if they are invoked with at least one argument.

*CoffeScript*:
``` coffeescript
name = 'Hard Rock'

alert name
# Equivalent to:
alert(name)

alert inspect a
# Equivalent to:
alert(inspect(a))
```
*JavaScript*:
``` javascript
var name;
name = 'Hard Rock';
alert(name);
alert(name);
alert(inspect(name));
alert(inspect(name));
```
Although parenthesis is optional, I'd recommend using it if it's not immediately obvious what's being invoked, and with which arguments. In the last example, with inspect, I'd definitely recommend wrapping at least the inspect invocation in parens.
``` coffeescript
alert inspect(a)
```

If you don't pass any arguments with an invocation, CoffeeScript has no way of working out if you intend to invoke the function, or just treat it like a variable. In this respect, CoffeeScript's behavior differs from Ruby which always invokes references to functions, and is more similar to Python's. This has been the source of a few errors in my CoffeeScript programs, so it's worth keeping an eye out for cases where you intend to call a function without any arguments, and include parenthesis.

## Function context

Context changes are rife within JavaScript, especially with event callbacks, so CoffeeScript provides a few helpers to manage this. One such helper is a variation on `->`, the fat arrow function: `=>`

Using the fat arrow instead of the thin arrow ensures that the function context will be bound to the local one. For example:

*CoffeScript*:
``` coffeescript
this.clickHandler = -> alert "clicked"
element.addEventListener "click", (e) => this.clickHandler(e)
```

*JavaScript*:
``` javascript
var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
this.clickHandler = function() {
  return alert("clicked");
};
element.addEventListener("click", __bind(function(e) {
  return this.clickHandler(e);
}, this));
```
The reason you might want to do this, is that callbacks from `addEventListener()` are executed in the context of the element, i.e. this equals the element. If you want to keep this equal to the local context, without doing a self = this dance, fat arrows are the way to go.
