## Scoping and variables safety

In CoffeeScript you don't have direct access to the var keyword, it's impossible to shadow an outer variable on purpose, you may only refer to it. So be careful that you're not reusing the name of an external variable accidentally, if you're writing a deeply nested function.

Although suppressed within this documentation for clarity, all CoffeeScript output is wrapped in an anonymous function.

    (function(){

      // your code goes here

    })();

This safety wrapper, combined with the automatic generation of the var keyword, make it exceedingly difficult to pollute the global namespace by accident.

If you'd like to create top-level variables for other scripts to use, attach them as properties on window, or on the exports object in CommonJS. The existential operator (covered below), gives you a reliable way to figure out where to add them; if you're targeting both CommonJS and the browser: `exports ? this`
