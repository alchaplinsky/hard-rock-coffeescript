## Decorator Pattern

Decorators are a structural design pattern that aim to promote code re-use. Similar to Mixins, they can be considered
another viable alternative to object sub-classing.

Classically, Decorators offered the ability to add behaviour to existing classes in a system dynamically. The idea was
that the decoration itself wasn't essential to the base functionality of the class, otherwise it would be baked into
the superclass itself.

They can be used to modify existing systems where we wish to add additional features to objects without the need to
heavily modify the underlying code using them. A common reason why developers use them is their applications may
contain features requiring a large quantity of distinct types of object. Imagine having to define hundreds of different
object constructors for say, a JavaScript game.

```coffeescript
class Component
  props: {}
  add: (key, val) ->
    @props[key] = val
  get: () ->
    @props
  process: () ->

class ConcreteComponent extends Component
  process: () ->

class Decorator extends Component
  constructor: (@component) ->
  process: () ->
    @component.process()

class ConcreteDecoratorA extends Decorator
  process: () ->
    @component.add "concreteDecoratorAProcess", true
    super()

class ConcreteDecoratorB extends Decorator
  process: () ->
    @component.add "concreteDecoratorBProcess", true
    super()

class Example
  @run: () ->
    cmpt = new ConcreteDecoratorA new ConcreteDecoratorB new ConcreteComponent()
    cmpt.process()

Example.run()
```
