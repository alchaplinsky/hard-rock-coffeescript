## Observer Pattern
The observer pattern is a software design pattern in which an object, called the subject, maintains a list of its dependents,
called observers, and notifies them automatically of any state changes, usually by calling one of their methods.

It is mainly used to implement distributed event handling systems. The Observer pattern is also a key part in the
familiar model–view–controller (MVC) architectural pattern.


```coffeescript
class RecordStudio
  constructor: () ->
    @subscribers = []
  notifyNewItemReleased: (item) ->
    subscriber.callback(item) for subscriber in @subscribers when subscriber.item is item
  subscribe: (to, onNewItemReleased) ->
    @subscribers.push { item: to, callback: onNewItemReleased }

class MetallicaFan
  onNewAlbum: (album) ->
    alert "I've got new '#{album}'"

class RedHotChiliPeppersFan
  onNewAlbum: (album) ->
    alert "I've got new '#{album}'"

EMI = new RecordStudio()
sub1 = new MetallicaFan()
sub2 = new RedHotChiliPeppersFan()
EMI.subscribe "Death Magnetic", sub1.onNewAlbum
EMI.subscribe "I'm with you", sub2.onNewAlbum
EMI.notifyNewItemReleased "Death Magnetic"
EMI.notifyNewItemReleased "I'm with you"
```
