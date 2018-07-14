Opening hours sanitizer - A corrector for the 'opening_hours' fields
=========================================================================

If you work with the `opening_hours` fields in OpenStreetMap, you probably need to check somewhere if a field is valid before to parse it, or to do anything with it.

Of course, for simple formats, can do this with regexes, but [specifications](https://wiki.openstreetmap.org/wiki/Key:opening_hours/specification) are so rich that a full regex to handle them is quite impossible.
This is the goal of this tiny module: check if an `opening_hours` field is valid, and try to correct it if it isn't.

In addition to the simple formats, like `Mo-Fr 10:00-20:00`, it can parse and fix almost all shapes of opening hours.
Here is what it can do.

```python
>>> from oh_sanitizer import sanitize_field
>>> print(sanitize_field("mo-fr 10h - 19h00"))
"Mo-Fr 10:00-19:00"
>>> print(sanitize_field("2010 - 2020/2 dec-feb 10:00 am - 12:00 am/1:00 pm-7:00pm"))
"2010-2020/2 Dec-Feb 10:00-12:00,13:00-19:00"
```

**It works both with Python 2 and 3.**

It is so small that you can include it directly into your projet.
You can also install it with PyPi:

    $ pip install oh-sanitizer

The `sanitize_field()` function can raise the following exceptions:
- `TypeError` : If the given field is not a string.
- `SanitizeError` : The generic exception of `oh_sanitizer`,
    raised when the field can't be parsed (if it is too complex,
    or "too much invalid").
- `InconsistentField` : Inheriting from `SanitizeError`,
    raised when the field contains an invalid pattern which can't
    be corrected automatically.

So, you can simple do this.

```python
from oh_sanitizer import sanitize_field, SanitizeError
field = "mo-fr 10h - 19h00"
try:
    sanitized_field = sanitize_field(field)
    print("Here is the sanitized field:", sanitized_field)
except SanitizeError:
    print("So bad, the field could not be sanitized.")
```

If you want to parse `opening_hours` fields to know, for example, whether a facility is open, OH Sanitizer is NOT what you need.
See the [Humanized Opening Hours](https://github.com/rezemika/humanized_opening_hours) module or its [alternatives](https://github.com/rezemika/humanized_opening_hours#alternatives).
