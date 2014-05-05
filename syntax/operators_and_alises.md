## Operators and aliases

CoffeeScript includes some useful aliases to provide you with shorthands. First one is `@`, which is an alias for `this` keyword in JavaScript.

*CoffeeScript*
``` coffeescript
goByGuitar = ->
  @guitar = true
```
*JavaScript*
``` javascript
var goByGuitar;
goByGuitar = function() {
  return this.guitar = true;
};
```

Another useful alias shortens your expression is ::, which is an alias for prototype.

*CoffeeScript*
``` coffeescript
Band::members = -> @members.length
```
*JavaScript*
``` javascript
Band.prototype.members = function() {
  return this.members.length;
};
```

Because the `==` operator frequently causes undesirable coercion, is intransitive, and has a different meaning than in other languages, CoffeeScript compiles `==` into `===`, and `!=` into  `!==`.

CoffeeScript also provides some human readable aliases for this operators: you can use `is` instead of `==` and `isnt` instead of `!=`. And also you can use `not` as an alias for `!`.

*CoffeeScript*
``` coffeescript
'life' is 'life' # true
'iron man' isnt 'sandman' # true
true is not false # true
```
*JavaScript*
``` javascript
'life' === 'life';
'iron man' !== 'sandman';
true === !false;
```
Logical operators aliases are pretty straightforward - `and` compiles to `&&`, and `or` into `||`.
You can also use `in` to test for array presence, and `of` to test for JavaScript object-key presence.

## The Existential Operator
It's a little difficult to check for the existence of a variable in JavaScript. `if (variable) ...`
comes close, but fails for zero, the empty string, and `false`.

### Existence
CoffeeScript's existential operator `?` returns `true` unless a variable is `null` or `undefined`, which makes it analogous to Ruby's `nil?`

Behind the scenes CoffeeScript will check previously defined variables like this:

``` javascript
variable != null;
```
and if variable haven't been defined previously like this:
``` javascript
typeof variable !== "undefined" && variable !== null;
```
### Conditional assignment
It can also be used for safer conditional assignment than `||=` provides, for cases where you may be handling numbers or strings.
``` coffeescript
band = null
band ?= 'Stone Sour'
```
### Or operator
You can also use it in place of the `||` operator:
``` coffeescript
band = missingName ? 'Halloween'
```

### Null check
You can skip a null check before accessing a property by placing the existential operator right before it.
Use `?.` instead of the dot accessor `.` in cases where the base value may be `null` or `undefined`.
If all of the properties exist then you'll get the expected result, if the chain is broken, `undefined` is
returned instead of the TypeError that would be raised otherwise.

*CoffeeScript*
``` coffeescript
singer.playTheGuitar()?.solo()
```
*JavaScript*
``` javascript
var _ref;
if ((_ref = singer.playTheGuitar()) != null) {
  _ref.solo();
}
```
### Callable check
Similarly you can check that a property is actually a function, and callable, by placing the existential
operator right before the parens. If the property doesn't exist, or isn't a function, it simply won't get called.

*CoffeeScript*
``` coffeescript
guitarist.sing().chorus?()
```
*JavaScript*
``` javascript
var _base;
if (typeof (_base = guitarist.sing()).chorus === "function") {
  _base.chorus();
}
```
