## Adapter pattern

The adapter pattern is a software design pattern that allows the interface of an existing class to be used from another
interface. It is often used to make existing classes work with others without modifying their source code.

Adapters basically allow objects or classes to function together which normally couldn't due to their incompatible interfaces.
The adapter translates calls to its interface into calls to the original interface and the code required to achieve this
is usually quite minimal.

```coffeescript
class Guitar
  strumTheStrings: ->
    "Guitar sound"

class Drums
  hitDrumWithStick: () ->
    "Drumkit sound"

class GuitarAdapter
  constructor: (@adaptee) ->
  playSound: () ->
    @adaptee.strumTheStrings()

class DrumsAdapter
  constructor: (@adaptee) ->
  playSound: () ->
    @adaptee.hitDrumWithStick()

class Client
  @run: () ->
    adaptee = new Guitar()
    adapter = new GuitarAdapter adaptee
    adapter.playSound() # Guitar sound

    adaptee = new Drums()
    adapter = new DrumsAdapter adaptee
    adapter.playSound() # Drumkit sound
Client.run()
```
