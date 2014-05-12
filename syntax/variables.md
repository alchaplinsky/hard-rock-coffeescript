## Variables and Scope
CoffeeScript fixes one of the major bugbears with JavaScript, global variables. In JavaScript,
it's all too easy to accidentally declare a global variable by forgetting to include var before the variable assignment.
CoffeeScript solves this by simply removing global variables. Behind the scenes, CoffeeScript wraps up scripts with an
anonymous function, keeping the local context, and automatically prefixes all variable assignments with var.
For example, take this simple variable assignment in CoffeeScript:

*CoffeeScript*
``` coffeescript
person = "Jimmy Hendrix"
```

*JavaScript*
``` javascript
var person;
person = "Jimmy Hendrix";
```

As you can see, the variable assignment is kept completely local, it's impossible to accidentally create a global variable. CoffeeScript actually takes this a step further, and makes it difficult to shadow a higher-level variable. This goes a great deal to prevent some of the most common mistakes developers make in JavaScript.

However, sometimes it's useful to create global variables. You can either do this by directly setting them as properties on the global object (window in browsers), or with the following pattern:

*CoffeeScript*

``` coffeescript
exports = this
exports.band = "Led Zeppelin"
```

*JavaScript*

``` javascript
var exports;
exports = this;
exports.band = "Led Zeppelin";
```


In the root context, this is equal to the global object, and by creating a local exports variable you're making it really obvious to anyone reading your code exactly which global variables a script is creating. Additionally, it paves the way for CommonJS modules, which we're going to cover later in the book.

## String interpolation
CoffeeScript brings Ruby style string interpolation to JavaScript. Double quotes strings can contain #{} tags, which contain expressions to be interpolated into the string.

*CoffeeScript*
``` coffeescript
band = 'Metallica'
dialog = "- What is your favorite band? - #{band}!"
```

*JavaScript*
``` javascript
var band, dialog;
band = 'Metallica';
dialog = "- What is your favorite band? - "+band+"!";
```

As you can see in the example above, multiline strings are also allowed, without having to prefix each line with a +:
