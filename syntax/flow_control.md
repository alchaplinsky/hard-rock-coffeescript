## Flow control
The convention of optional parentheses continues with CoffeeScript's if and else keywords.

*CoffeeScript*

    if true == true
      "Rock'n'Roll"

    if true != true then "Let it be"

    if 1 > 0 then "Ok" else "Y2K!"

*JavaScript*

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

As you can see above, if the if statement is on one line, you'll need to use the then keyword, so CoffeeScript knows when the block begins. Conditional operators (?:) are not supported, instead you should use a single line if/else statement.

CoffeeScript also includes a Ruby idiom of allowing suffixed if statements.

*CoffeeScript*

    alert "It's cold!" if heat < 5

*JavaScript*

    if (heat < 5) {
      alert("It's cold!");
    }

Instead of using the exclamation mark (!) for negation, you can also use the not keyword - which can sometimes make your code more readable as exclamation marks can be easy to miss.

*CoffeeScript*

    if not true then "Rock'n'Roll"

*JavaScript*

    if (!true) {
      "Rock'n'Roll";
    }

In the example above, we could also use the CoffeeScript's unless statement, the opposite of if.

*CoffeeScript*

    unless true
      "Rock'n'Roll"

*JavaScript*

    if (!true) {
      "Rock'n'Roll";
    }

In a similar fashion to not, CoffeeScript also introduces the is statement, which translates to ===.

*CoffeeScript*

    if true is 1
      "Type coercion fail!"

*JavaScript*

    if (true === 1) {
      "Type coercion fail!";
    }

As an alternative to is not, you can use isnt.

*CoffeeScript*

    if true isnt true
      alert "Try to rock as hard as you can!"

You may have noticed in the examples above, that CoffeeScript is converting `==` operators into `===` and `!=` into `!==`. This is one of my favorite features to the language, and yet one of the most simple. What's the reasoning behind this? Well frankly JavaScript's type coercion is a bit odd, and its equality operator coerces types in order to compare them, leading to some confusing behaviors and the source of many bugs.
