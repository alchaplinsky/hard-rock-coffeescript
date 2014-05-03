## Factory Method Pattern

The factory method pattern is a creational pattern which uses factory methods to deal with the problem of creating
objects without specifying the exact class of object that will be created.

Imagine that we have a UI factory where we are asked to create a type of UI component. Rather than creating this component
directly using the new operator or via another creational constructor, we ask a Factory object for a new component instead.
We inform the Factory what type of object is required (like "Button", "Popup") and it instantiates this, returning it to us
for use.

This is particularly useful if the object creation process is relatively complex, e.g. if it strongly depends on dynamic
factors or application configuration.

```coffeescript
class FenderGuitar
  constructor: (model) ->
    @type = "Fender #{model}"
class GibsonGuitar
  constructor: (model) ->
    @type = "Gibson #{model}"
class JacksonGuitar
  constructor: (model) ->
    @type = "Jackson #{model}"

class GuitarFactory
  makeGuitar: (model) ->
    switch model
        when "Stratocaster" then new FenderGuitar(model)
        when "Les Paul" then new GibsonGuitar(model)
        when "Soloist" then new JacksonGuitar(model)

factory = new GuitarFactory

factory.makeGuitar("Stratocaster").type # => "Fender Stratocaster"

factory.makeGuitar("Les Paul").type # => "Gibson Les Paul"

factory.makeGuitar("Soloist").type # => "Jackson Soloist"
```
