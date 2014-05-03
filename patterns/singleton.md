## Singleton Pattern

The Singleton pattern is used to restrict instantiation of a class to a single object.
Usually the Singleton pattern is implemented by creating a class with a method that creates a new instance of the
this class if one doesn't exist. In the case of an instance already exists, it simply returns a reference to that object.

This is useful when exactly one object is needed to coordinate actions across the system. The Abstract Factory, Builder,
and Prototype patterns can use Singletons in their implementation. Singletons are often preferred to global variables because
they do not pollute the global namespace (or, in languages with namespaces, their containing namespace) with unnecessary variables.
And they permit lazy allocation and initialization, whereas global variables in many languages will always consume resources.

```coffeescript
class JimiHendrix

  instance = null

  class PrivateClass
    constructor: (@favoriteSong) ->
    echo: -> @favoriteSong

  @get: (favoriteSong) ->
    instance ?= new PrivateClass(favoriteSong)

a = JimiHendrix.get "Purple Haze"
a.echo() # => "Purple Haze"

b = JimiHendrix.get "Welcome to the Jungle"
b.echo() # => "Purple Haze"

JimiHendrix.instance # => undefined
a.instance # => undefined
JimiHendrix.PrivateClass # => undefined
```
