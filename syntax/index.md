## Scoping and variables safety

In CoffeeScript you don't have direct access to the var keyword, it's impossible to shadow an outer variable on purpose, you may only refer to it. So be careful that you're not reusing the name of an external variable accidentally, if you're writing a deeply nested function.

Although suppressed within this documentation for clarity, all CoffeeScript output is wrapped in an anonymous function.
``` javascript
(function(){

  // your code goes here

})();
```
This safety wrapper, combined with the automatic generation of the var keyword, make it exceedingly difficult to pollute the global namespace by accident.

If you'd like to create top-level variables for other scripts to use, attach them as properties on window, or on the exports object in CommonJS. The existential operator (covered below), gives you a reliable way to figure out where to add them; if you're targeting both CommonJS and the browser: `exports ? this`

## Comments
Comments are in the same format as Ruby comments, starting with a hash character.
``` coffeescript
# Commented line of code
```
Multiline comments are also supported, and are brought forward to the generated JavaScript. They're enclosed by three hash characters.
``` coffeescript
###
  Commented block of code
###
```

## Block Strings

Multiline strings are allowed in CoffeeScript. Lines are joined by a single space unless they end with a backslash. Indentation is ignored.

``` coffeescript
quote = "They’d say “if ya play the record backwards,
        you can hear evil tings like grrrr!” and I would think,
        “Jeez, I didn’t know the devil sounded like that.
        I thought he was coherent, like the rest of us
                        - Brian Johnson of ACDC - 2001"
```

Block strings can be used to hold formatted or indentation-sensitive text (or, if you just don't feel like escaping
quotes and apostrophes). The indentation level that begins the block is maintained throughout, so you can keep it all
aligned with the body of your code.

``` coffeescript
quote = """
          <div class='quote'>
            We believed that anything that was worth doing was worth overdoing.
          </div>
        """
```

Double-quoted block strings, like other double-quoted strings, allow interpolation.

## Block Regular Expressions

Similar to block strings and comments, CoffeeScript supports block regexes — extended regular expressions that ignore
internal whitespace and can contain comments and interpolation. Modeled after Perl's ```/x``` modifier, CoffeeScript's
 block regexes are delimited by ```///``` and go a long way towards making complex regular expressions readable. To quote from the
 CoffeeScript source:

 ``` coffeescript
OPERATOR = /// ^ (
  ?: [-=]>             # function
   | [-+*/%<>&|^!?=]=  # compound assign / compare
   | >>>=?             # zero-fill right shift
   | ([-+:])\1         # doubles
   | ([&|<>])\2=?      # logic / shift
   | \?\.              # soak access
   | \.{2,3}           # range or splat
) ///
 ```

``` javascript
var OPERATOR;
OPERATOR = /^(?:[-=]>|[-+*\/%<>&|^!?=]=|>>>=?|([-+:])\1|([&|<>])\2=?|\?\.|\.{2,3})/;
```
