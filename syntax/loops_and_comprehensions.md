## Loops and Comprehensions
Array iteration in JavaScript has a rather archaic syntax, reminiscent of an older language like C
rather than a modern object orientated one. The introduction of ES5 improved that situation somewhat,
with the forEach() function, but that still requires a function call every iteration and is therefore
much slower. Again, CoffeeScript comes to the rescue, with a beautiful syntax:

*CoffeeScript*

    for surname in ["Young", "Gilmour", "Blackmore"]
      console.log "David #{surname}"

*JavaScript*

    var surname, _i, _len, _ref;
    _ref = ["Young", "Gilmour", "Blackmore"];
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      surname = _ref[_i];
      console.log("David " + surname);
    }

If you need the current iteration index, you are able to pass an extra argument:

*CoffeeScript*

    for count, i in ["one", "two", "three"]
      console.log "#{i} - #{count}"

*JavaScript*

    var i, count, _len, _ref;
    _ref = ["one", "two", "three"];
    for (i = 0, _len = _ref.length; i < _len; i++) {
      count = _ref[i];
      alert("" + i + " - " + count);
    }

You can also iterate on one line, using the suffix form by placing `for` at the end of expression

*CoffeScript*

    like guitarist for guitarist in ["Young", "Gilmour", "Blackmore"]

*JavaScript*

    var guitarist, _i, _len, _ref;
    _ref = ["Young", "Gilmour", "Blackmore"];
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      guitarist = _ref[_i];
      like(guitarist);
    }

And also filtering is available in comprehensions Python style:

    guitarists = ["Young", "Gilmour", "Blackmore"]
    like guitarist for guitarist in guitarists when guitarist[0] is "G"


You can also use comprehensions for iterating over properties in objects. Instead of the in keyword, use of.

*CoffeeScript*

      names = Angus: "Young", David: "Gilmour", Richie: "Blackmore"
      alert("#{first} #{last}") for first, last of names

*JavaScript*

      var first, last, names;
      names = {
        Angus: "Young",
        David: "Gilmour",
        Richie: "Blackmore"
      };
      for (first in names) {
        last = names[first];
        alert("" + first + " " + last);
      }

The only low-level loop that CoffeeScript exposes is the `while` loop. This has similar behavior to the while
loop in pure JavaScript, but has the added advantage that it returns an array of results, i.e. like
the Array.prototype.map() function.
