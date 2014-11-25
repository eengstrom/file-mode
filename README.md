# file-mode package

Atom.io package to set syntax mode based on comment string (-*- mode: MODE -*-).

### Why?

Automatically sets the syntax highlighting mode when Atom can't properly guess it.

### How?

Somewhere in the file, create a comment of this form:
```
# -*- mode: NAME -*-
```

When the file is opened, the syntax will be set to `NAME`, e.g. `CoffeeScript`, `bash`, etc...  The matching is exact and case sensitive, _caveat emptor_.
