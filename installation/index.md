# Installation
In order to get started with CoffeeScript you need to compile it to JavaScript nativly supported by browsers. Here you have couple options:

You can use the browser-based CoffeeScript compiler, by including [compiler script](http://jashkenas.github.io/coffee-script/extras/coffee-script.js) in a page, marking up any CoffeeScript script tags with the correct type like:
```html
<script src="http://jashkenas.github.com/coffee-script/extras/coffee-script.js" type="text/javascript"></script>
<script type="text/coffeescript">
    # your coffee code
</script>
```
This will compile all your CoffeeScript code to JavaScript at runtime.

There's also a command line version of coffee compiler that is available as Node.js utility. The core compiler however, does not depend on Node, and can be run in any JavaScript environment.

To install, first make sure you have a working copy of the latest stable version of Node.js, and npm (the Node Package Manager). You can then install CoffeeScript with npm:
```
npm install -g coffee-script
```

Once installed, you are able to run coffee command, which can execute scripts, compile ```.coffee``` files into ```.js```, and provide an interactive console, which you can use to quickly execute CoffeeScript statements.

The coffee command takes a bunch of useful options like:

```-c, --compile``` – Compile a ```.coffee``` script into a ```.js``` JavaScript file of the same name.

```-m, --map``` – Generate source maps alongside the compiled JavaScript files. Adds sourceMappingURL directives to the JavaScript as well.

```-i, --interactive``` – Launch an interactive CoffeeScript session to try short snippets. Identical to calling ```coffee``` with no arguments.

```-o, --output [DIR]``` – Write out all compiled JavaScript files into the specified directory. Use in conjunction with ```--compile``` or ```--watch```.

```-j, --join [FILE]```	 Before compiling, concatenate all scripts together in the order they were passed, and write them into the specified file. Useful for building large projects.

```-w, --watch```	 Watch files for changes, rerunning the specified command when any file is updated.

```-b, --bare```	 Compile the JavaScript without the top-level function safety wrapper.

You can check out all options related to your version of coffee-script by running:

    coffee --help

Of course there are more convenient ways to automatically compile CoffeeScript
instead of running ```coffee``` command in console. We'll take a look at them later.
