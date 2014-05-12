## Flow control
The convention of optional parentheses continues with CoffeeScript's if and else keywords.

*CoffeeScript*
``` coffeescript
if true == true
  "Rock'n'Roll"

if true != true then "Let it be"

if 1 > 0 then "Ok" else "Y2K!"
```
*JavaScript*
``` javascript
if (true === true) {
  "Rock'n'Roll";
}
if (true !== true) {
  "Let it be";
}
if (1 > 0) {
  "Ok";
} else {
  "Y2K!";
}
```
As you can see above, if the if statement is on one line, you'll need to use the then keyword, so CoffeeScript knows when the block begins. Conditional operators (?:) are not supported, instead you should use a single line if/else statement.

CoffeeScript also includes a Ruby idiom of allowing suffixed if statements.

*CoffeeScript*
``` coffeescript
alert "It's cold!" if heat < 5
```
*JavaScript*
``` javascript
if (heat < 5) {
  alert("It's cold!");
}
```
Instead of using the exclamation mark (!) for negation, you can also use the not keyword - which can sometimes make your code more readable as exclamation marks can be easy to miss.

*CoffeeScript*
``` coffeescript
if not true then "Rock'n'Roll"
```
*JavaScript*
``` javascript
if (!true) {
  "Rock'n'Roll";
}
```
In the example above, we could also use the CoffeeScript's unless statement, the opposite of if.

*CoffeeScript*
``` coffeescript
unless true
  "Rock'n'Roll"
```
*JavaScript*
``` javascript
if (!true) {
  "Rock'n'Roll";
}
```
In a similar fashion to not, CoffeeScript also introduces the is statement, which translates to ===.

*CoffeeScript*
``` coffeescript
if true is 1
  "Type coercion fail!"
```
*JavaScript*
``` javascript
if (true === 1) {
  "Type coercion fail!";
}
```
As an alternative to is not, you can use isnt.

*CoffeeScript*
``` coffeescript
if true isnt true
  alert "Try to rock as hard as you can!"
```
You may have noticed in the examples above, that CoffeeScript is converting `==` operators into `===` and `!=` into `!==`. This is one of my favorite features to the language, and yet one of the most simple. What's the reasoning behind this? Well frankly JavaScript's type coercion is a bit odd, and its equality operator coerces types in order to compare them, leading to some confusing behaviors and the source of many bugs.

### Chained Comparisons

CoffeeScript borrows chained comparisons from Python — making it easy to test if a value falls within a certain range.

*CoffeeScript*
``` coffeescript
PinkFloydAlbums = 14
fromTenToTwenty = 20 > PinkFloydAlbums > 10 # true
```
*JavaScript*
``` javascript
var PinkFloydAlbums, fromTenToTwenty;
PinkFloydAlbums = 14;
fromTenToTwenty = (20 > PinkFloydAlbums && PinkFloydAlbums > 10);
```
