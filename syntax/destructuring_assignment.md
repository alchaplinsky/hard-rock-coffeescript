## Destructuring Assignment

To make extracting values from complex arrays and objects more convenient, CoffeeScript implements ECMAScript Harmony's
proposed destructuring assignment syntax. When you assign an array or object literal to a value, CoffeeScript breaks up
and matches both sides against each other, assigning the values on the right to the variables on the left. In the simplest
case, it can be used for parallel assignment. Look at this little White Stripes example:

*CoffeeScript*
```coffeescript
  guitar = "Meg White"
  drums  = "Jack White"
  [guitar, drums] = [drums, guitar] # ['Jack White', 'Meg White']
```

*JavaScript*
```javascript
var drums, guitar, _ref;
guitar = "Meg White";
drums = "Jack White";
_ref = [drums, guitar], guitar = _ref[0], drums = _ref[1];
```

But it's also helpful for dealing with functions that return multiple values.

*CoffeeScript*
```coffeescript
  bandMembers = (name) ->
    # Retrieving members via ajax
    ['Kurt Cobain', 'Dave Grohl', 'Krist Novoselic']
  [guitar, drums, base] =  bandMembers "Nirvana"
```

*JavaScript*
```javascript
var bandMembers, base, drums, guitar, _ref;
bandMembers = function(name) {
  return ['Kurt Cobain', 'Dave Grohl', 'Krist Novoselic'];
};
_ref = bandMembers("Nirvana"), guitar = _ref[0], drums = _ref[1], base = _ref[2];
```

Destructuring assignment can be used with any depth of array and object nesting, to help pull out deeply nested properties.

*CoffeeScript*
```coffeescript
ledZeppelin =
  vocal: "Robert Plant"
  drums: "John Bonham"
  guitarist:
    name:   "Jimmy Page"
    vocal:  false
    guitars: [
      "Gibson Les Paul"
      "Gibson EDS-1275"
    ]

{guitarist: {name, vocal, guitars: [first, second]}} = ledZeppelin
```

*JavaScript*
```javascript
var first, ledZeppelin, name, second, vocal, _ref, _ref1;
ledZeppelin = {
  vocal: "Robert Plant",
  drums: "John Bonham",
  guitarist: {
    name: "Jimmy Page",
    vocal: false,
    guitars: ["Gibson Les Paul", "Gibson EDS-1275"]
  }
};
_ref = ledZeppelin.guitarist, name = _ref.name, vocal = _ref.vocal, (_ref1 = _ref.guitars, first = _ref1[0], second = _ref1[1]);
```

Destructuring assignment can even be combined with splats.


*CoffeeScript*
```coffeescript
  name = "Ronnie James Dio"
  [firstname, middle, lastname] = name.split " "
```

*JavaScript*
```javascript
var firstname, lastname, middle, name, _ref;
name = "Ronnie James Dio";
_ref = name.split(" "), firstname = _ref[0], middle = _ref[1], lastname = _ref[2];
```

Expansion can be used to retrieve elements from the end of an array without having to assign the rest of its values. It works in function parameter lists as well.

*CoffeeScript*
```coffeescript
  name = "Ronnie James (more middle names here) Dio"
  [firstname, middle..., lastname] = name.split " "
```

*JavaScript*
```javascript
var firstname, lastname, name, _ref;
name = "Ronnie James (more middle names here) Dio";
_ref = name.split(" "), firstname = _ref[0], lastname = _ref[_ref.length - 1];
```

Destructuring assignment is also useful when combined with class constructors to assign properties to your instance from an options object passed to the constructor.

*CoffeeScript*
```coffeescript
class Frontman
  constructor: (options) ->
    {@name, @vocals, @guitar} = options

jaymz = new Frontman
  name: 'James Hetfield'
  vocals: true
  guitar: true
```

*JavaScript*
```javascript
var Frontman, jaymz;
Frontman = (function() {
  function Frontman(options) {
    this.name = options.name, this.vocals = options.vocals, this.guitar = options.guitar;
  }
  return Frontman;
})();

jaymz = new Frontman({
  name: 'James Hetfield',
  vocals: true,
  guitar: true
});
```
