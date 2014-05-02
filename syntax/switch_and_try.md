## Switch/When/Else

Switch statements in JavaScript are a bit awkward. You need to remember to break at the end of every case statement to
avoid accidentally falling through to the default case. CoffeeScript prevents accidental fall-through, and can convert
the ```switch```   into a returnable, assignable expression. The format is: ```switch``` condition,  ```when``` clauses,
 ```else``` the default case.

Like in Ruby, switch statements in CoffeeScript can take multiple values for each when clause. If any of the values match,
the clause runs.

*CoffeeScript*
``` coffeescript
switch member
  when "Jimmy Page" then goPlayGuitar
  when "Sid Vicious" then goDrinkBeer
  when "Lars Ulrich" then goSmashDrumkit
  when "Axl Rose" then goSingAloud
  else goHome
```
*JavaScript*
``` javascript
switch (member) {
  case "Jimmy Page":
    goPlayGuitar;
    break;
  case "Sid Vicious":
    goDrinkBeer;
    break;
  case "Lars Ulrich":
    goSmashDrumkit;
    break;
  case "Axl Rose":
    goSingAloud;
    break;
  default:
    goHome;
}
```

## Try/Catch/Finally

Try/catch statements are just about the same as JavaScript, the only difference - they work as expressions.

*CoffeeScript*
``` coffeescript
try
  listenToAcDc()
  notSingAlongWithBrianJohnson()
catch error
  console.log error
finally
  cleanUp()
```
*JavaScript*
``` javascript
var error;

try {
  listenToAcDc();
  notSingAlongWithBrianJohnson();
} catch (_error) {
  error = _error;
  console.log(error);
} finally {
  cleanUp();
}
```
