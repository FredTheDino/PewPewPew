# Annoying things:
## Typechecker errors can be vaugue
```
typecheck error: gfx.sy:244
      Got '(fn * -> (int, int))', which it cannot be
      Expected this to be an enum
 242 |             lq :: list.get' lquads, sprite
 243 |             xy :: (list.get(quads, sprite)
 244 |                    -> maybe.map' (pu q -> (as_int(q[1][0] / 2), as_int(q[1][1] / 2)) end)
                                         ^^
help:
      Requirement came from
   5 |
   6 | orDefault :: pu maybe, a ->
   7 |     case maybe do
           ^^^^
```
The problem here is actually the `'` calling that doesn't interact well with arrows.
Maybe the arrows should bind so they seperate `'` calls.
That is:
```
a -> b' x -> c' x <=> c(b(a, x), x)
```

